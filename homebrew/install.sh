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
brew install github/gh/gh
brew install imagemagick
brew install libyaml
brew install mas
brew install mysql
brew install node
brew install openssh
brew install openssl@1.1
brew install pngquant
brew install python
brew install shellcheck
brew install trash
brew install tree
brew install zopfli

echo -e "\\n⬇️  Installing fonts via Homebrew Cask"

brew tap homebrew/cask-fonts

brew cask install font-ia-writer-duospace
brew cask install font-ia-writer-mono
brew cask install font-inconsolata
brew cask install font-lato
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

echo -e "\\n⬇️  Installing Mac App Store applications via MAS"

mas install 937984704 # Amphetamine
mas install 924726344 # Deliveries
mas install 1435957248 # Drafts
mas install 1099120373 # Exporter
mas install 975937182 # Fantastical
mas install 1493996622 # Front and Center
mas install 439697913 # Icon Slate
mas install 441258766 # Magnet
mas install 1289197285 # Mindnode 6
mas install 1295203466 # Microsoft Remote Desktop 10
mas install 1346203938 # OmniFocus 3
mas install 407963104 # Pixelmator
mas install 463362050 # PhotoSweeper
mas install 1529448980 # Reeder 5
mas install 442168834 # Site Sucker
mas install 1528890965 # TextSniper
mas install 1191449274 # ToothFairy
mas install 494803304 # WiFi Explorer

echo -e "\\n⬇️  Installing applications via Homebrew Cask"

brew tap homebrew/cask-versions

brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" cleanmymac
brew cask install --appdir="/Applications" colour-contrast-analyser
brew cask install --appdir="/Applications" commandq
brew cask install --appdir="/Applications" couleurs
brew cask install --appdir="/Applications" cyberduck
brew cask install --appdir="/Applications" daisydisk
brew cask install --appdir="/Applications" dash
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" downie
brew cask install --appdir="/Applications" encryptme
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" hazel
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" kaleidoscope
brew cask install --appdir="/Applications" kap
brew cask install --appdir="/Applications" little-snitch
brew cask install --appdir="/Applications" namechanger
brew cask install --appdir="/Applications" screaming-frog-seo-spider
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" sim-daltonism
brew cask install --appdir="/Applications" sketchup
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" superduper
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" ticktick
brew cask install --appdir="/Applications" tower
brew cask install --appdir="/Applications" zoomus
