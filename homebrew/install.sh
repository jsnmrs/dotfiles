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
brew install act
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
brew install webp
brew install zopfli

echo -e "\\n⬇️  Installing fonts"

brew tap homebrew/cask-fonts

brew install --cask font-ia-writer-duospace
brew install --cask font-ia-writer-mono
brew install --cask font-ibm-plex
brew install --cask font-inconsolata
brew install --cask font-lato
brew install --cask font-source-code-pro
brew install --cask font-source-sans-pro

echo -e "\\n⬇️  Installing Mac App Store applications"

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
mas install 1547106997 # Pins for Pinboard
mas install 407963104 # Pixelmator
mas install 463362050 # PhotoSweeper
mas install 1529448980 # Reeder 5
mas install 442168834 # Site Sucker
mas install 1528890965 # TextSniper
mas install 1191449274 # ToothFairy
mas install 494803304 # WiFi Explorer

echo -e "\\n⬇️  Installing applications"

brew install --cask 1password
brew install --cask alfred
brew install --cask arq
brew install --cask bartender
brew install --cask calibre
brew install --cask cleanmymac
brew install --cask colour-contrast-analyser
brew install --cask commandq
brew install --cask couleurs
brew install --cask cyberduck
brew install --cask daisydisk
brew install --cask dash
brew install --cask docker
brew install --cask downie
brew install --cask encryptme
brew install --cask firefox
brew install --cask focus
brew install --cask google-chrome
brew install --cask handbrake
brew install --cask hazel
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask jump
brew install --cask kaleidoscope
brew install --cask kap
brew install --cask lingon-x
brew install --cask little-snitch
brew install --cask namechanger
brew install --cask screaming-frog-seo-spider
brew install --cask sequel-pro
brew install --cask sim-daltonism
brew install --cask sketchup
brew install --cask slack
brew install --cask spotify
brew install --cask sublime-text
brew install --cask superduper
brew install --cask the-unarchiver
brew install --cask ticktick
brew install --cask timemator
brew install --cask tower
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
brew install --cask zoom
