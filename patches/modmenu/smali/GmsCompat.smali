.class public final Lmodmenu/GmsCompat;
.super Ljava/lang/Object;
.source "GmsCompat.java"


# static fields
.field private static final CLIENT_ID:Ljava/lang/String; = "64961101293-acdj2rrf77cn1n81fk4srh0s6242o4mp.apps.googleusercontent.com"

.field private static final LEGACY_RC:I = 0xf4a1c


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static deliver(Lorg/appplay/lib/sdk/GoogleLoginSDK;ILjava/lang/String;)V
    .locals 7

    .line 73
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "callGame"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 75
    invoke-virtual {v0, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 76
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v5

    aput-object p2, v1, v6

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    goto :goto_0

    .line 77
    :catch_0
    move-exception p0

    .line 82
    :goto_0
    return-void
.end method

.method public static legacySignIn(Lorg/appplay/lib/sdk/GoogleLoginSDK;Landroid/app/Activity;)V
    .locals 2

    .line 38
    :try_start_0
    new-instance v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    sget-object v1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->DEFAULT_SIGN_IN:Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    invoke-direct {v0, v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;-><init>(Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)V

    const-string v1, "64961101293-acdj2rrf77cn1n81fk4srh0s6242o4mp.apps.googleusercontent.com"

    .line 40
    invoke-virtual {v0, v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->requestIdToken(Ljava/lang/String;)Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->build()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    move-result-object v0

    .line 42
    nop

    .line 43
    invoke-static {p1, v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getClient(Landroid/app/Activity;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->getSignInIntent()Landroid/content/Intent;

    move-result-object v0

    .line 42
    const v1, 0xf4a1c

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    goto :goto_0

    .line 44
    :catch_0
    move-exception p1

    .line 45
    const/4 p1, -0x1

    const-string v0, ""

    invoke-static {p0, p1, v0}, Lmodmenu/GmsCompat;->deliver(Lorg/appplay/lib/sdk/GoogleLoginSDK;ILjava/lang/String;)V

    .line 47
    :goto_0
    return-void
.end method

.method public static onResult(Lorg/appplay/lib/sdk/GoogleLoginSDK;Landroid/content/Intent;)V
    .locals 3

    .line 50
    const-string v0, ""

    if-nez p1, :cond_0

    .line 51
    const/4 p1, 0x0

    invoke-static {p0, p1, v0}, Lmodmenu/GmsCompat;->deliver(Lorg/appplay/lib/sdk/GoogleLoginSDK;ILjava/lang/String;)V

    .line 52
    return-void

    .line 55
    :cond_0
    const/4 v1, -0x1

    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/auth/api/signin/internal/zbm;->zbd(Landroid/content/Intent;)Lcom/google/android/gms/auth/api/signin/GoogleSignInResult;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInResult;->getSignInAccount()Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object p1

    .line 56
    if-nez p1, :cond_1

    .line 57
    invoke-static {p0, v1, v0}, Lmodmenu/GmsCompat;->deliver(Lorg/appplay/lib/sdk/GoogleLoginSDK;ILjava/lang/String;)V

    .line 58
    return-void

    .line 60
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getIdToken()Ljava/lang/String;

    move-result-object p1

    .line 61
    if-nez p1, :cond_2

    .line 62
    invoke-static {p0, v1, v0}, Lmodmenu/GmsCompat;->deliver(Lorg/appplay/lib/sdk/GoogleLoginSDK;ILjava/lang/String;)V

    .line 63
    return-void

    .line 65
    :cond_2
    const/4 v2, 0x1

    invoke-static {p0, v2, p1}, Lmodmenu/GmsCompat;->deliver(Lorg/appplay/lib/sdk/GoogleLoginSDK;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    goto :goto_0

    .line 66
    :catch_0
    move-exception p1

    .line 67
    invoke-static {p0, v1, v0}, Lmodmenu/GmsCompat;->deliver(Lorg/appplay/lib/sdk/GoogleLoginSDK;ILjava/lang/String;)V

    .line 69
    :goto_0
    return-void
.end method
