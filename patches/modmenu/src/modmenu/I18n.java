package modmenu;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Menu and notification strings, selected by the device locale with English
 * as the fallback for languages that have no table.
 *
 * Tables are plain source maps: rewording a string or adding a language is
 * an edit here followed by regen.sh. No resource ids are involved, so the
 * committed smali stays deterministic and scopecheck's modmenu directory
 * whitelist keeps covering it.
 */
public final class I18n {
    private static final Map<String, String> EN = en();
    private static final Map<String, String> STRINGS = select();

    private I18n() {}

    public static String t(String key) {
        String value = STRINGS.get(key);
        return value != null ? value : EN.get(key);
    }

    private static Map<String, String> select() {
        Locale locale = Locale.getDefault();
        String lang = locale.getLanguage();
        if ("vi".equals(lang)) {
            return vi();
        }
        if ("zh".equals(lang)) {
            String country = locale.getCountry();
            if ("TW".equals(country) || "HK".equals(country) || "MO".equals(country)) {
                return zhHant();
            }
            return zh();
        }
        return EN;
    }

    private static Map<String, String> en() {
        Map<String, String> m = new HashMap<>();
        m.put("notif.title", "Mini World");
        m.put("notif.text", "Mod menu notification - tap to open the menu");
        m.put("menu.title", "Mod Menu");
        m.put("web.label", "Block WebView / browser");
        m.put("web.desc", "Prevent opening the browser or any web page in game");
        m.put("hwid.label", "Spoof HWID");
        m.put("hwid.desc", "Emulate the device identity - or rotate to a new ID");
        m.put("reward.label", "Skip rewarded ads");
        m.put("reward.desc", "Bypass ads - reward credited right after you tap");
        m.put("rotate", "Change spoofed HWID");
        m.put("close", "Close");
        m.put("rotate.toast", "HWID changed - applies on next game launch");
        return m;
    }

    private static Map<String, String> vi() {
        Map<String, String> m = new HashMap<>();
        m.put("notif.title", "Mini World");
        m.put("notif.text", "Thông báo của mod menu, click để mở menu");
        m.put("menu.title", "Mod Menu");
        m.put("web.label", "Chặn WebView / trình duyệt");
        m.put("web.desc", "Không mở trình duyệt hoặc trang web trong game");
        m.put("hwid.label", "Giả mạo HWID");
        m.put("hwid.desc", "Giả lập định danh thiết bị — hoặc xoay sang ID mới");
        m.put("reward.label", "Nhận thưởng không xem quảng cáo");
        m.put("reward.desc", "Bỏ qua quảng cáo — cộng thưởng ngay khi bấm");
        m.put("rotate", "Đổi HWID giả mạo");
        m.put("close", "Đóng");
        m.put("rotate.toast", "Đã đổi HWID — áp dụng ở lần mở game sau");
        return m;
    }

    private static Map<String, String> zh() {
        Map<String, String> m = new HashMap<>();
        m.put("notif.title", "Mini World");
        m.put("notif.text", "模组菜单通知——点击打开菜单");
        m.put("menu.title", "模组菜单");
        m.put("web.label", "屏蔽 WebView / 浏览器");
        m.put("web.desc", "阻止在游戏内打开浏览器或任何网页");
        m.put("hwid.label", "伪造 HWID");
        m.put("hwid.desc", "模拟设备标识——或轮换为新 ID");
        m.put("reward.label", "跳过激励广告");
        m.put("reward.desc", "跳过广告——点击即可立即获得奖励");
        m.put("rotate", "更换伪造的 HWID");
        m.put("close", "关闭");
        m.put("rotate.toast", "HWID 已更换——下次启动游戏时生效");
        return m;
    }

    private static Map<String, String> zhHant() {
        Map<String, String> m = new HashMap<>();
        m.put("notif.title", "Mini World");
        m.put("notif.text", "模組選單通知——點擊開啟選單");
        m.put("menu.title", "模組選單");
        m.put("web.label", "封鎖 WebView / 瀏覽器");
        m.put("web.desc", "阻止在遊戲內開啟瀏覽器或任何網頁");
        m.put("hwid.label", "偽造 HWID");
        m.put("hwid.desc", "模擬裝置識別碼——或輪換為新 ID");
        m.put("reward.label", "跳過激勵廣告");
        m.put("reward.desc", "跳過廣告——點擊即可立即獲得獎勵");
        m.put("rotate", "更換偽造的 HWID");
        m.put("close", "關閉");
        m.put("rotate.toast", "HWID 已更換——下次啟動遊戲時生效");
        return m;
    }
}
