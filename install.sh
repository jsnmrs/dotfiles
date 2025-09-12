#!/usr/bin/env bash

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "This script is only for macOS"
  exit 1
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -e "\\n⬇️ Set up Homebrew"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo -e "\\n⬇️ Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo -e "\\n⭐️ Installed Homebrew! Close all terminal sessions and run this script again."
  exit
fi

echo -e "\\n🔁 Homebrew is installed! Updating instead."
# Enable parallel downloads
export HOMEBREW_CURL_RETRIES=3
export HOMEBREW_NO_AUTO_UPDATE=1  # Skip auto-update since we just updated
export HOMEBREW_BAT=1  # Enable parallel installations
export HOMEBREW_INSTALL_CLEANUP=1  # Auto cleanup after installations

brew update && brew upgrade

# Remove any existing node symlinks that might conflict
brew unlink node 2>/dev/null || true

# Install everything
echo -e "\\n⬇️ Installing everything from Brewfile"
brew bundle

# Force link node if needed
brew link --overwrite node 2>/dev/null || true

# Cleanup
brew cleanup

echo -e "\\n✅ Installation complete!"

# Set up Ruby
echo -e "\\n⬇️ Setting up Ruby"
if ! command -v rbenv &> /dev/null; then
  echo "rbenv not found. Please ensure it was installed via Homebrew"
  exit 1
fi

# Initialize rbenv to run now
eval "$(rbenv init -)"

# Get latest stable Ruby version
latest_ruby=$(rbenv install -l 2>/dev/null | grep -E "^[[:space:]]*[0-9]+\.[0-9]+\.[0-9]+[[:space:]]*$" | tail -1 | xargs)

if [ -z "$latest_ruby" ]; then
  echo "Error: Could not determine latest Ruby version"
  exit 1
fi

echo "Latest Ruby version detected: $latest_ruby"

# Check if already installed
if rbenv versions | grep -q "$latest_ruby"; then
  echo "Ruby $latest_ruby is already installed"
else
  echo "Installing Ruby $latest_ruby..."
  rbenv install "$latest_ruby"
fi

rbenv global "$latest_ruby"

echo -e "\\n⬇️ Install global Ruby gems"
gem install bundler
gem install github-pages

# if fatal error: 'openssl/ssl.h' file not found, see:
# https://github.com/eventmachine/eventmachine/issues/936


# Set up Node
echo -e "\\n⬇️ Setup NVM, Node, and global NPM packages"

# Load NVM if it exists
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if ! command -v nvm &> /dev/null; then
  echo -e "\\n⬇️  Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  # Load NVM immediately after installation
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1091
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

nvm install node --reinstall-packages-from=node

if test ! "$(npm --version)"
  then
  echo -e "\\nNPM not installed"
else
  echo -e "\\n⬇️ Install global Node modules"
  # Read packages from centralized list
  if [ -f "npm-global-packages.txt" ]; then
    while IFS= read -r package || [ -n "$package" ]; do
      # Skip empty lines and comments
      if [ -n "$package" ] && [[ ! "$package" =~ ^# ]]; then
        echo "Installing: $package"
        npm install "$package" --location=global
      fi
    done < npm-global-packages.txt
  else
    echo "Warning: npm-global-packages.txt not found"
  fi
fi

# Set up Composer
echo -e "\\n⬇️ Set up Composer, install globals"

# Save current directory
current_path=$(pwd)

if ! command -v composer &> /dev/null; then
  echo -e "\\nComposer not installed"
else
  echo -e "\\n⬇️ Install global Composer libraries"
  rsync -avh --no-perms "composer.json" "$HOME/.composer"

  cd "$HOME/.composer" || exit
  composer update
fi

# Return to original directory
cd "$current_path" || exit

# Install Docksal
DOCKER_NATIVE=1 bash <(curl -fsSL https://get.docksal.io)

echo -e "\\n⬇️  Configure macOS dock"

# ./dock - contributed by @rpavlick
# https://github.com/rpavlick/add_to_dock

function add_app_to_dock {
  # adds an application to macOS Dock
  # usage: add_app_to_dock "Application Name"
  # example add_app_to_dock "Terminal"

  app_name="${1}"
  launchservices_path="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
  app_path=$(${launchservices_path} -dump | grep -o "/\S*${app_name}.app" | grep -v -E "Backups|Caches|TimeMachine|Temporary|/Volumes/${app_name}" | uniq | sort | head -n1)
  if open -Ra "${app_path}"; then
      echo "$app_path added to the Dock."
      defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app_path}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  else
      echo "ERROR: $1 not found." 1>&2
  fi
}

function add_folder_to_dock {
  # adds a folder to macOS Dock
  # usage: add_folder_to_dock "Folder Path" -s n -d n -v n
  # example: add_folder_to_dock "~/Downloads" -d 0 -s 2 -v 1
  # key:
  # -s or --sortby
  # 1 -> Name
  # 2 -> Date Added
  # 3 -> Date Modified
  # 4 -> Date Created
  # 5 -> Kind
  # -d or --displayas
  # 0 -> Stack
  # 1 -> Folder
  # -v or --viewcontentas
  # 0 -> Automatic
  # 1 -> Fan
  # 2 -> Grid
  # 3 -> List

  folder_path="${1}"
  sortby="1"
  displayas="0"
  viewcontentas="0"
  while [[ "$#" -gt 0 ]]
  do
      case $1 in
          -s|--sortby)
          if [[ $2 =~ ^[1-5]$ ]]; then
              sortby="${2}"
          fi
          ;;
          -d|--displayas)
          if [[ $2 =~ ^[0-1]$ ]]; then
              displayas="${2}"
          fi
          ;;
          -v|--viewcontentas)
          if [[ $2 =~ ^[0-3]$ ]]; then
              viewcontentas="${2}"
          fi
          ;;
      esac
      shift
  done

  if [ -d "$folder_path" ]; then
      echo "$folder_path added to the Dock."
      defaults write com.apple.dock persistent-others -array-add "<dict>
              <key>tile-data</key> <dict>
                  <key>arrangement</key> <integer>${sortby}</integer>
                  <key>displayas</key> <integer>${displayas}</integer>
                  <key>file-data</key> <dict>
                      <key>_CFURLString</key> <string>file://${folder_path}</string>
                      <key>_CFURLStringType</key> <integer>15</integer>
                  </dict>
                  <key>file-type</key> <integer>2</integer>
                  <key>showas</key> <integer>${viewcontentas}</integer>
              </dict>
              <key>tile-type</key> <string>directory-tile</string>
          </dict>"
  else
      echo "ERROR: $folder_path not found."
  fi
}

function add_spacer_to_dock {
  # adds an empty space to macOS Dock
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
}

function clear_dock {
  # removes all persistent icons from macOS Dock
  defaults write com.apple.dock persistent-apps -array
}

function reset_dock {
  # reset macOS Dock to default settings
  defaults write com.apple.dock; killall Dock
}

clear_dock

add_app_to_dock "Firefox Developer Edition"
add_app_to_dock "Fantastical"
add_app_to_dock "OmniFocus"
add_app_to_dock "Obsidian"
add_app_to_dock "Notes"
add_app_to_dock "Claude"
add_spacer_to_dock
add_app_to_dock "iTerm"
add_app_to_dock "Void"
add_app_to_dock "Tower"
add_app_to_dock "VMware Fusion"
add_app_to_dock "Spotify"
# add_folder_to_dock "${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Documents/Inbox" -s 2 -d 0 -v 2

killall Dock

# macOS configuration
echo -e "\\n⬇️  Configure macOS"

# Adapted from:
# https://mths.be/macos
# https://github.com/kdeldycke/dotfiles/blob/master/scripts/macos-config.sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Set computer name (as done via System Preferences → Sharing)
# sudo scutil --set ComputerName "ComputerName"
# sudo scutil --set HostName "ComputerName"
# sudo scutil --set LocalHostName "ComputerName"
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "ComputerName"

# Deactivate Apple Intelligence
defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "false"

# Remove default content
sudo rm -rf ~/Public/Drop\ Box
rm -rf ~/Public/.com.apple.timemachine.supported

# Set Use dark menu bar and Dock
sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceStyle Dark

# Menu bar: hide some and show some
defaults -currentHost write com.apple.systemuiserver dontAutoLoad -array \
        "/System/Library/CoreServices/Menu Extras/User.menu" \
        "/System/Library/CoreServices/Menu Extras/Eject.menu" \
        "/System/Library/CoreServices/Menu Extras/TextInput.menu" \
        "/System/Library/CoreServices/Menu Extras/Displays.menu" \
        "/System/Library/CoreServices/Menu Extras/VPN.menu"
defaults write com.apple.systemuiserver menuExtras -array \
        "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
        "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
        "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
        "/System/Library/CoreServices/Menu Extras/Volume.menu" \
        "/System/Library/CoreServices/Menu Extras/Battery.menu" \
        "/System/Library/CoreServices/Menu Extras/Clock.menu"

# Set highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Disable the over-the-top focus ring animation
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Adjust toolbar title rollover delay
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable Firewall. 1 = on for specific sevices.
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Enable stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

# Enable firewall logging
sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -int 1

# Enable secondary click (right-click)
defaults write com.apple.AppleMultitouchMouse MouseButtonMode TwoButton

# Set mouse and scrolling speed.
defaults write NSGlobalDomain com.apple.mouse.scaling -int 3
defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.6875

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 20

# Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleMetricUnits -bool false

# Set the timezone
sudo defaults write /Library/Preferences/com.apple.timezone.auto Active -bool true
sudo defaults write /Library/Preferences/com.apple.timezone.auto TimeZoneName -string "America/New_York"
sudo sntp -sS time.apple.com
sudo systemsetup -setusingnetworktime on

# Disable the startup sound
sudo nvram StartupMute=%01

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Disable the Spotlight keyboard shortcut (⌘ + Space) so Raycast can use it
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; value = { parameters = (32, 49, 1048576); type = standard; }; }"

# Disable Show Finder search window (⌥ + ⌘ + Space) so OmniFocus can use it
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "{ enabled = 0; value = { parameters = (32, 49, 1572864); type = standard; }; }"

# Enable touchID for sudo, persists across software updates
# Backup the original file first
if [ -f /etc/pam.d/sudo_local ]; then
  sudo cp /etc/pam.d/sudo_local "/etc/pam.d/sudo_local.backup.$(date +%Y%m%d%H%M%S)"
  echo "Backed up existing sudo_local to /etc/pam.d/sudo_local.backup.*"
fi

# Modify the file
sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local

# Verify the modification
if ! sudo -n true 2>/dev/null; then
  echo "Warning: sudo authentication may have been affected"
  echo "Backup available at: /etc/pam.d/sudo_local.backup.*"
else
  echo "TouchID for sudo enabled successfully"
fi

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Set iCloud Drive folder as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file:///${HOME}/Library/Mobile%20Documents/com~apple~CloudDocs/Documents/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Set the icon size of Dock items to 52 pixels
defaults write com.apple.dock tilesize -int 52

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Bottom right screen corner → Desktop
defaults write com.apple.dock wvous-br-corner -int 4

# Press Tab to highlight each item on a web page
sudo defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
sudo defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
sudo defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
sudo defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Show Safari’s bookmarks bar by default
sudo defaults write com.apple.Safari ShowFavoritesBar -bool true

# Hide Safari’s sidebar in Top Sites
sudo defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
sudo defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
sudo defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
sudo defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
sudo defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
sudo defaults write com.apple.Safari IncludeDevelopMenu -bool true
sudo defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable continuous spellchecking
sudo defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

# Disable auto-correct
sudo defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Disable AutoFill
sudo defaults write com.apple.Safari AutoFillFromAddressBook -bool false
sudo defaults write com.apple.Safari AutoFillPasswords -bool false
sudo defaults write com.apple.Safari AutoFillCreditCardData -bool false
sudo defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Warn about fraudulent websites
sudo defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Disable plug-ins
sudo defaults write com.apple.Safari WebKitPluginsEnabled -bool false
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false

# Disable Java
sudo defaults write com.apple.Safari WebKitJavaEnabled -bool false
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false

# Block pop-up windows
sudo defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Disable auto-playing video
sudo defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
sudo defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
sudo defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

# Update extensions automatically
sudo defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Deny location services access from websites (without prompting)
sudo defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 0

# Set Zsh as default shell
sudo chsh -s /bin/zsh "$USERNAME"
sudo chsh -s /bin/zsh root

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Install the color theme for iTerm2
open "./assets/jsnmrs.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# Google Chrome: Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Google Chrome: Disable the all too sensitive backswipe on Magic Mouse
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false

# Google Chrome: Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true

# Docker Desktop: set RAM allocation
defaults write com.docker.docker memoryMiB -int 4096

# Batch kill applications at the end
kill_apps() {
  local apps=(
    "Activity Monitor" "Address Book" "Calendar" "Contacts"
    "Dock" "Finder" "Mail" "Safari" "SystemUIServer"
  )
  for app in "${apps[@]}"; do
    killall "$app" &>/dev/null || true
  done
}

echo "Done. Note that some of these changes require a logout/restart to take effect."

