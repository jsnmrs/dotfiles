/*** Arkenfox user.js overrides ***/
/*
 * https://github.com/arkenfox/user.js
 * 1. copy this file into profile directory
 * 2. use prefsCleaner.sh in profile directory to zero all preferences
 * 3. use updater.sh in profile directory to update user.js, merge overrides
***/
user_pref("_user.js.parrot", "overrides section syntax error");

/* 0208: set search region ***/
user_pref("browser.search.region", "US"); // [HIDDEN PREF]

/* 0301b: enable auto-CHECKING for extension and theme updates ***/
user_pref("extensions.update.enabled", true);

/* 0410: enable SB (Safe Browsing) ***/
user_pref("browser.safebrowsing.malware.enabled", true);
user_pref("browser.safebrowsing.phishing.enabled", true);

/* 0801: enable location bar using search ***/
user_pref("keyword.enabled", true);

/* 0807: enable live search suggestions ***/
user_pref("browser.search.suggest.enabled", true);
user_pref("browser.urlbar.suggest.searches", true);

/* 0850b: disable tab-to-search [FF85+] ***/
user_pref("browser.urlbar.suggest.engines", false);

/* 0901: disable saving passwords ***/
user_pref("signon.rememberSignons", false);

/* 1021: disable storing extra session data [SETUP-CHROME]
 * 0=everywhere, 1=unencrypted sites, 2=nowhere ***/
user_pref("browser.sessionstore.privacy_level", 1);

/* 1030: enable favicons in shortcuts ***/
user_pref("browser.shell.shortcutFavicons", true);

/* 2030: disable autoplay of HTML5 media [FF63+]
 * 0=Allow all, 1=Block non-muted media (default in FF67+), 5=Block all (FF69+) ***/
user_pref("media.autoplay.default", 5);

/* 2402: enable website access to clipboard events/content ***/
user_pref("dom.event.clipboardevents.enabled", true);

/* 2404: enable clipboard commands (cut/copy) from "non-privileged" content [FF41+] ***/
user_pref("dom.allow_cut_copy", true);

/* 2024: set a default permission for Camera/Microphone [FF58+]
 * 0=always ask (default), 1=allow, 2=block ***/
user_pref("permissions.default.camera", 2);
user_pref("permissions.default.microphone", 2);

/* 2304: disable Web Notifications ***/
user_pref("dom.webnotifications.enabled", false); // [FF22+]

/* 2306: set a default permission for Notifications (both 2304 and 2305) [FF58+]
 * 0=always ask (default), 1=allow, 2=block ***/
user_pref("permissions.default.desktop-notification", 2);

/* 2520: disable virtual reality devices ***/
user_pref("dom.vr.enabled", false);

/* 2601: permit accessibility services to accessing your browser ***/
user_pref("accessibility.force_disabled", 0);

/* 2607: enable various developer tools in browser context ***/
user_pref("devtools.chrome.enabled", true);

/* 2702: set third-party cookies (if enabled, see 2701) to session-only ***/
user_pref("network.cookie.thirdparty.sessionOnly", false);
user_pref("network.cookie.thirdparty.nonsecureSessionOnly", true); // [FF58+]

/* 2803: set what items to clear on shutdown (if 2802 is true) ***/
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.history", false); // Browsing & Download History
user_pref("privacy.clearOnShutdown.offlineApps", false); // Offline Website Data
user_pref("privacy.clearOnShutdown.sessions", false); // Active Logins

/* 4504: disable RFP letterboxing [FF67+] ***/
user_pref("privacy.resistFingerprinting.letterboxing", false); // [HIDDEN PREF]

/* 4604: [2512] disable device sensor API ***/
user_pref("device.sensors.enabled", false);

/* 4606: [2501] disable gamepad API - USB device ID enumeration ***/
user_pref("dom.gamepad.enabled", false);

// 4608: [2021] disable the SpeechSynthesis (Text-to-Speech) part of the Web Speech API ***/
user_pref("media.webspeech.synth.enabled", false);

/* APPEARANCE ***/
user_pref("browser.download.autohideButton", false); // [FF57+]
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true); // [FF68+] allow userChrome/userContent
user_pref("browser.uidensity", 1); // 1=compact

/* CONTENT BEHAVIOR ***/
user_pref("accessibility.typeaheadfind", true); // enable "Find As You Type"

/* UX FEATURES: disable and hide the icons and menus ***/
user_pref("extensions.pocket.enabled", false); // Pocket Account [FF46+]

/* OTHER ***/
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false); // disable CFR [FF67+]
user_pref("dom.flyweb.enabled", false); // disable FlyWeb (LAN/proximity IoT devices)
user_pref("accessibility.AOM.enabled", true); // enable Accessibility Object Model (AOM)

user_pref("_user.js.parrot", "overrides section successful");
