#!/usr/bin/env bash

# Install or update Homebrew
if ! brew --version >/dev/null 2>&1
  then
  echo -e "\\n⬇️  Installing Homebrew"
  # Clean-up any failed Homebrew installs first
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo -e "\\n🔁  Updating installed Homebrew"
  brew update
fi

echo -e "\\n⬇️  Installing Homebrew casks"

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

brew cask install font-inconsolata
brew cask install font-lato
brew cask install font-open-sans
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

mas install 937984704 # Amphetamine
mas install 975937182 # Fantastical 2
mas install 775737590 # iA Writer
mas install 439697913 # Icon Slate
mas install 408981434 # iMovie
mas install 1295203466 # Microsoft Remote Desktop 10
mas install 1346203938 # OmniFocus 3
mas install 880001334 # Reeder
mas install 904280696 # Things 3
mas install 494803304 # WiFi Explorer

brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" aerial
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" arq
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" cleanmymac
brew cask install --appdir="/Applications" colour-contrast-analyser
brew cask install --appdir="/Applications" couleurs
brew cask install --appdir="/Applications" daisydisk
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" encryptme
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" kaleidoscope
brew cask install --appdir="/Applications" kindle
brew cask install --appdir="/Applications" knockknock
brew cask install --appdir="/Applications" licecap
brew cask install --appdir="/Applications" little-snitch
brew cask install --appdir="/Applications" microsoft-office
brew cask install --appdir="/Applications" moom
brew cask install --appdir="/Applications" namechanger
brew cask install --appdir="/Applications" omnidisksweeper
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" sketchup
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" superduper
brew cask install --appdir="/Applications" taskpaper
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" ticktick
brew cask install --appdir="/Applications" tower
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" transmit4
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" virtualbox-extension-pack
brew cask install --appdir="/Applications" zoomus

# Install Box Notes
echo -e "\\n⬇️  Downloading and installing Box Notes"
cd ~/Downloads || exit
curl -O https://e3.boxcdn.net/box-installers/boxnotes/mac/latest/Box%20Notes.zip
unzip -q Box%20Notes.zip
rm Box%20Notes.zip
mv "Box Notes.app" "/Applications/Box Notes.app"
echo -e "\\n✅  Box Notes installed"
