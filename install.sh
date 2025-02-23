#!/usr/bin/env bash

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

brew update && brew upgrade

# Remove any existing node symlinks that might conflict
brew unlink node 2>/dev/null || true

# Install everything
echo -e "\\n⬇️ Installing everything from Brewfile"
brew bundle --no-lock

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
latest_ruby=$(rbenv install -l | grep -v - | tail -1 | tr -d '[:space:]')
if ! rbenv versions | grep -q "$latest_ruby"; then
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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if ! command -v nvm &> /dev/null; then
  echo -e "\\n⬇️  Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  # Load NVM immediately after installation
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

nvm install node --reinstall-packages-from=node

if test ! "$(npm --version)"
  then
  echo -e "\\nNPM not installed"
else
  echo -e "\\n⬇️ Install global Node modules"
  npm install npm-check-updates --location=global
  npm install npm-check --location=global
  npm install pa11y-ci --location=global
  npm install pa11y-ci-reporter-html --location=global
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

# WARNING: permanently clears existing dock
clear_dock

add_app_to_dock "Firefox Developer Edition"
add_app_to_dock "Google Chrome"
add_spacer_to_dock
add_app_to_dock "Fantastical"
add_app_to_dock "OmniFocus"
add_app_to_dock "Obsidian"
add_app_to_dock "Notes"
add_spacer_to_dock
add_app_to_dock "iTerm"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "Tower"
add_app_to_dock "Parallels Desktop"
add_spacer_to_dock
add_app_to_dock "Shortcuts"
add_app_to_dock "Spotify"
add_folder_to_dock "${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Documents/Inbox" -s 2 -d 0 -v 2

killall Dock
