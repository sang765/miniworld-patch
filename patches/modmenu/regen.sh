#!/usr/bin/env bash
# Regenerate patches/modmenu/smali from the Java sources under src/.
#
# CI never runs this - the smali is committed, so a build needs no JDK. Run it
# after editing any src/modmenu/*.java and commit the smali diff together with
# the source change.
#
# Pipeline: javac -> d8 -> classes.dex zipped into a resource-less carrier APK
# -> apktool d, which baksmalis the dex into plain smali. baksmali is not a
# standalone CLI here; apktool's decode is the supported path to smali.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
sdk="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/android-sdk}}"

android_jar=$(ls -1 "$sdk"/platforms/android-*/android.jar 2>/dev/null | sort -V | tail -1)
d8=$(ls -1 "$sdk"/build-tools/*/d8 2>/dev/null | sort -V | tail -1)
aapt2=$(command -v aapt2 || true)
[ -n "$android_jar" ] || { echo "regen: no android.jar under $sdk/platforms" >&2; exit 1; }
[ -n "$d8" ]         || { echo "regen: no d8 under $sdk/build-tools" >&2; exit 1; }
[ -n "$aapt2" ]      || { echo "regen: aapt2 not on PATH" >&2; exit 1; }

if [ -z "${APKTOOL_JAR:-}" ]; then
  if [ -f "$here/../../tools/apktool.jar" ]; then
    APKTOOL_JAR="$here/../../tools/apktool.jar"
  elif [ -n "${PREFIX:-}" ] && [ -f "$PREFIX/share/java/apktool.jar" ]; then
    APKTOOL_JAR="$PREFIX/share/java/apktool.jar"
  fi
fi
[ -n "${APKTOOL_JAR:-}" ] || { echo "regen: apktool jar not found" >&2; exit 1; }

build=$(mktemp -d "${TMPDIR:-/tmp}/mwmodmenu.XXXXXX")
trap 'rm -rf "$build"' EXIT
mkdir -p "$build/classes" "$build/dex"

# CommonNatives and the game's GoogleLoginSDK / bundled play-services sign-in
# classes live in the game's dexes, not in any jar javac can see, and AdReward
# and GmsCompat call them: compile stubs into their own directory so javac
# resolves them but no stub class ever reaches d8 or the shipped smali.
mkdir -p "$build/stubsrc/org/appplay/lib" "$build/stubsrc/org/appplay/lib/sdk" \
         "$build/stubsrc/org/appplay/lib/utils" \
         "$build/stubsrc/com/minitech/player" \
         "$build/stubsrc/com/google/android/gms/auth/api/signin/internal" "$build/stubcls"
cat > "$build/stubsrc/org/appplay/lib/CommonNatives.java" <<'EOF'
package org.appplay.lib;

public final class CommonNatives {
    private CommonNatives() {}

    public static void javaCallLuaEvent(String event, Object[] args) {}

    public static void onWatchAD(int code) {}
}
EOF
cat > "$build/stubsrc/org/appplay/lib/GameBaseActivity.java" <<'EOF'
package org.appplay.lib;

import com.minitech.player.AppPlayer;

public class GameBaseActivity extends android.app.Activity {
    public AppPlayer m_AppPlayer;
}
EOF
# IdNames reads the in-game language through this class; the real one lives
# in the game's dexes, and the stub only has to satisfy javac.
cat > "$build/stubsrc/org/appplay/lib/utils/LanguageUtils.java" <<'EOF'
package org.appplay.lib.utils;

import android.content.Context;

public class LanguageUtils {
    public static int getMobileLang(Context context) {
        return -1;
    }

    public static String getLanuageByGame(int lang) {
        return "";
    }
}
EOF
cat > "$build/stubsrc/com/minitech/player/AppPlayer.java" <<'EOF'
package com.minitech.player;

import android.content.Context;
import android.view.InputEvent;
import android.view.SurfaceView;

public class AppPlayer extends android.widget.FrameLayout {
    public AppPlayer(Context context) {
        super(context);
    }

    public boolean injectEvent(InputEvent event) {
        return false;
    }

    public SurfaceView getSurfaceView() {
        return null;
    }
}
EOF
cat > "$build/stubsrc/org/appplay/lib/sdk/GoogleLoginSDK.java" <<'EOF'
package org.appplay.lib.sdk;

public class GoogleLoginSDK {}
EOF
cat > "$build/stubsrc/com/google/android/gms/auth/api/signin/GoogleSignInOptions.java" <<'EOF'
package com.google.android.gms.auth.api.signin;

public class GoogleSignInOptions {
    public static final GoogleSignInOptions DEFAULT_SIGN_IN = new GoogleSignInOptions();

    public static class Builder {
        public Builder(GoogleSignInOptions base) {}

        public Builder requestIdToken(String serverClientId) {
            return this;
        }

        public GoogleSignInOptions build() {
            return new GoogleSignInOptions();
        }
    }
}
EOF
cat > "$build/stubsrc/com/google/android/gms/auth/api/signin/GoogleSignIn.java" <<'EOF'
package com.google.android.gms.auth.api.signin;

import android.app.Activity;

public class GoogleSignIn {
    private GoogleSignIn() {}

    public static GoogleSignInClient getClient(Activity activity, GoogleSignInOptions options) {
        return null;
    }
}
EOF
cat > "$build/stubsrc/com/google/android/gms/auth/api/signin/GoogleSignInClient.java" <<'EOF'
package com.google.android.gms.auth.api.signin;

import android.content.Intent;

public class GoogleSignInClient {
    public Intent getSignInIntent() {
        return null;
    }
}
EOF
cat > "$build/stubsrc/com/google/android/gms/auth/api/signin/GoogleSignInResult.java" <<'EOF'
package com.google.android.gms.auth.api.signin;

public class GoogleSignInResult {
    public GoogleSignInAccount getSignInAccount() {
        return null;
    }
}
EOF
cat > "$build/stubsrc/com/google/android/gms/auth/api/signin/GoogleSignInAccount.java" <<'EOF'
package com.google.android.gms.auth.api.signin;

public class GoogleSignInAccount {
    public String getIdToken() {
        return null;
    }
}
EOF
cat > "$build/stubsrc/com/google/android/gms/auth/api/signin/internal/zbm.java" <<'EOF'
package com.google.android.gms.auth.api.signin.internal;

import android.content.Intent;

import com.google.android.gms.auth.api.signin.GoogleSignInResult;

public final class zbm {
    private zbm() {}

    public static GoogleSignInResult zbd(Intent data) {
        return null;
    }
}
EOF
javac -source 8 -target 8 -encoding UTF-8 -nowarn \
  -classpath "$android_jar" -d "$build/stubcls" \
  $(find "$build/stubsrc" -name '*.java')

javac -source 8 -target 8 -encoding UTF-8 -nowarn \
  -classpath "$android_jar:$build/stubcls" -d "$build/classes" \
  "$here"/src/modmenu/*.java

"$d8" --min-api 19 --lib "$android_jar" --output "$build/dex" \
  $(find "$build/classes" -name '*.class')

printf '%s\n' \
  '<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="modmenu.carrier"/>' \
  > "$build/AM.xml"
"$aapt2" link -I "$android_jar" -o "$build/carrier.apk" --manifest "$build/AM.xml"
(cd "$build/dex" && zip -q "$build/carrier.apk" classes.dex)

java -jar "$APKTOOL_JAR" d -f -o "$build/out" "$build/carrier.apk" >/dev/null

mkdir -p "$build/smali_out"
cp "$build"/out/smali/modmenu/*.smali "$build/smali_out/"
rm -rf "$here/smali"
mv "$build/smali_out" "$here/smali"
ls -1 "$here/smali"
