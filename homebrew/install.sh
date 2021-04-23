#!/usr/bin/env bash

if test ! "$(brew --version)"
  then
  echo -e "\\n⬇️  Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo -e "\\n🔁 Updating installed Homebrew"
  brew update
  brew upgrade
fi

echo -e "\\n⬇️  Installing Homebrew formulae"

brew install act
brew install composer
brew install git
brew install mas
brew install node
brew install openssh
brew install openssl@1.1
brew install shellcheck
brew install webp

echo -e "\\n⬇️  Installing fonts"

brew tap homebrew/cask-fonts

brew install --cask font-ia-writer-duospace
brew install --cask font-ia-writer-mono
brew install --cask font-ibm-plex
brew install --cask font-inter
brew install --cask font-lato
brew install --cask font-source-code-pro
brew install --cask font-source-sans-pro

echo -e "\\n⬇️  Installing Mac App Store applications"

mas install 1547371478 # Acorn 7
mas install 937984704 # Amphetamine
mas install 924726344 # Deliveries
mas install 1435957248 # Drafts
mas install 1099120373 # Exporter
mas install 975937182 # Fantastical
mas install 1493996622 # Front and Center
mas install 439697913 # Icon Slate
mas install 1289197285 # Mindnode 6
mas install 1295203466 # Microsoft Remote Desktop 10
mas install 1346203938 # OmniFocus 3
mas install 1547106997 # Pins for Pinboard
mas install 1289583905 # Pixelmator Pro
mas install 463362050 # PhotoSweeper
mas install 1529448980 # Reeder 5
mas install 1518036000 # Sequel Ace
mas install 442168834 # Site Sucker
mas install 1528890965 # TextSniper
mas install 494803304 # WiFi Explorer

echo -e "\\n⬇️  Installing applications"

brew install --cask 1password
brew install --cask adobe-acrobat-pro
brew install --cask alfred
brew install --cask arq
brew install --cask bartender
brew install --cask calibre # rosetta 2
brew install --cask cleanmymac
brew install --cask colour-contrast-analyser # rosetta 2
brew install --cask commandq # rosetta 2
brew install --cask cyberduck # rosetta 2
brew install --cask daisydisk
brew install --cask docker
brew install --cask downie
brew install --cask encryptme # rosetta 2
brew install --cask firefox
brew install --cask google-chrome
brew install --cask hazel
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask kaleidoscope # rosetta 2
brew install --cask lingon-x # rosetta 2
brew install --cask little-snitch
# brew install --cask microsoft-office
brew install --cask moom
brew install --cask nova
brew install --cask screaming-frog-seo-spider # rosetta 2
brew install --cask slack
brew install --cask spotify # rosetta 2
brew install --cask sublime-text # rosetta 2
brew install --cask ticktick
brew install --cask timemator
brew install --cask tower
brew install --cask zoom
