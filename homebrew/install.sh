#!/usr/bin/env bash

if test ! "$(brew --version)"
  then
  echo -e "\\n⬇️  Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo -e "\\n🔁 Updating installed Homebrew"
  brew update
  brew upgrade
fi

echo -e "\\n⬇️  Installing Homebrew formulae"

brew install ack
brew install cmake
brew install composer
brew install coreutils
brew install git
brew install git-lfs
brew install libyaml
brew install mas
brew install mysql
brew install openssh
brew install openssl@1.1
brew install python
brew install shellcheck
brew install trash
brew install tree

echo -e "\\n⬇️  Installing fonts via Homebrew Cask"

brew cask install font-inconsolata
brew cask install font-lato
brew cask install font-open-sans
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

echo -e "\\n⬇️  Installing Mac App Store applications via MAS"

mas install 937984704 # Amphetamine
mas install 1435957248 # Drafts
mas install 1099120373 # Exporter
mas install 975937182 # Fantastical
mas install 1493996622 # Front and Center
mas install 775737590 # iA Writer
mas install 439697913 # Icon Slate
mas install 408981434 # iMovie
mas install 441258766 # Magnet
mas install 1289197285 # Mindnode 6
mas install 1295203466 # Microsoft Remote Desktop 10
mas install 1346203938 # OmniFocus 3
mas install 407963104 # Pixelmator
mas install 880001334 # Reeder 3
# mas install 1449412482 # Reeder 4
mas install 442168834 # Site Sucker
mas install 904280696 # Things 3
mas install 494803304 # WiFi Explorer

echo -e "\\n⬇️  Installing applications via Homebrew Cask"

brew tap homebrew/cask-versions

brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" applepi-baker
brew cask install --appdir="/Applications" arq
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" cleanmymac
brew cask install --appdir="/Applications" colour-contrast-analyser
brew cask install --appdir="/Applications" couleurs
brew cask install --appdir="/Applications" daisydisk
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" encryptme
brew cask install --appdir="/Applications" figma
brew cask install --appdir="/Applications" firefox-developer-edition # homebrew/cask-versions
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" kaleidoscope
brew cask install --appdir="/Applications" kap
brew cask install --appdir="/Applications" little-snitch
brew cask install --appdir="/Applications" microsoft-office
brew cask install --appdir="/Applications" namechanger
brew cask install --appdir="/Applications" omnidisksweeper
brew cask install --appdir="/Applications" screaming-frog-seo-spider
brew cask install --appdir="/Applications" scrutiny
brew cask install --appdir="/Applications" sequel-pro
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
brew cask install --appdir="/Applications" transmit4 # homebrew/cask-versions
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" virtualbox-extension-pack
brew cask install --appdir="/Applications" zoomus
