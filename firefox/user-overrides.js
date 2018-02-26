/* START CUSTOM PREFS */

user_pref("_user.js.parrot", "CUSTOM PREFS");

// DIFFS
user_pref("browser.startup.page", 0);				// set homepage to blank
user_pref("keyword.enabled", true);               		// enable location bar using search 
user_pref("browser.display.use_document_fonts", 1);             // '0' breaks the display of uBlock and uMatrix on Linux
user_pref("browser.download.forbid_open_with", false);          // allow the `open with` option when downloading a file
user_pref("browser.sessionstore.max_tabs_undo", 10);            // allow to restore closed tabs
user_pref("browser.sessionstore.max_windows_undo", 10);         // allow to restore closed windows
user_pref("browser.urlbar.autocomplete.enabled", true);         // allow auto-complete of text entered in the address bar
user_pref("browser.urlbar.suggest.bookmark", true);             // allow auto-complete of text entered in the address bar
user_pref("browser.urlbar.suggest.openpage", true);             // allow auto-complete of text entered in the address bar
user_pref("full-screen-api.enabled", true);                     // enable full-screen video capability
user_pref("layout.spellcheckDefault", 2);                       // enable spell-check for single line inputs
user_pref("network.cookie.cookieBehavior", 1);                  // allow all 1st party cookies by default and control them with an add-on
user_pref("signon.rememberSignons", false);           		// do not remember logins and passwords
user_pref("browser.sessionstore.resume_from_crash", true);    	// enable resuming session from crash
user_pref("browser.tabs.closeWindowWithLastTab", true);     	// enable closing browser with last tab
user_pref("browser.backspace_action", 0);             		// backspace goes back one page
user_pref("dom.event.clipboardevents.enabled", true);           // `false' breaks TinyMCE editor paste (Ctrl+V) such as is used by WordPress, possibly others
user_pref("dom.allow_cut_copy", true);              		// enables clipboard commands
user_pref("browser.ctrlTab.previews", false);      		// disable Ctrl+Tab previews

// user_pref("dom.workers.enabled", true);                         // unbreak coin-hive.com login, some other sites
// user_pref("security.OCSP.enabled", 0);                          // disable on-line verification of SSL certificates (can cause sites to load slower or not at all if the service is down - you should typically NOT disable this)
// user_pref("dom.popup_allowed_events", "change click dblclick mouseup notificationclick reset submit touchend");  // allow all default JS pop-up events

// OTHER
user_pref("full-screen-api.warning.timeout", 0);                        // disable full-screen warning
user_pref("full-screen-api.warning.delay", 0);                          // how long to display a warning ("YouTube is now Fullscreen") when a site enters full-screen mode - `0` disables the warning
user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);  // allow WebExtensions to work on websites operated by Mozilla (FF 57 +)

user_pref("_user.js.parrot", "SUCCESS: No no he's not dead, he's, he's restin'!");

/* END CUSTOM PREFS */
