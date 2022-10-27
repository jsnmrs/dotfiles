#!/usr/bin/env bash

echo -e "\\n⬇️  Set up Homebrew and install almost everything"

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

brew install automake
brew install bat
brew install composer
brew install coreutils
brew install ffmpeg
brew install git
brew install imagemagick
brew install mas
brew install node
brew install openssh
brew install openssl@1.1
brew install pure
brew install qemu
brew install shellcheck
brew install svgo
brew install webp
brew install yamllint
brew install youtube-dl
brew install zopfli
brew install zsh-autosuggestions

# https://github.com/dalance/amber/issues/46#issuecomment-756813259
brew install danopia/tools/amber

echo -e "\\n⬇️  Installing fonts"

brew tap homebrew/cask-fonts

brew install --cask font-atkinson-hyperlegible
brew install --cask font-ia-writer-duospace
brew install --cask font-ia-writer-mono
brew install --cask font-ibm-plex
brew install --cask font-inter
brew install --cask font-lato

echo -e "\\n⬇️  Installing applications"

brew tap homebrew/cask-drivers

brew install --cask 1password
brew install --cask 1password/tap/1password-cli
mas install 1547371478 # Acorn 7
brew install --cask adobe-acrobat-pro
brew install --cask alfred
mas install 937984704 # Amphetamine
brew install --cask asana
brew install --cask bartender
brew install --cask caldigit-docking-utility
brew install --cask calibre
# Cascable Pro Webcam https://cascable.se/pro-webcam/
brew install --cask cleanmymac
brew install --cask colour-contrast-analyser
brew install --cask commandq
brew install --cask cyberduck
brew install --cask daisydisk
mas install 290986013 # Deliveries
brew install --cask docker
brew install --cask downie
mas install 1435957248 # Drafts
mas install 1099120373 # Exporter
mas install 975937182 # Fantastical
brew install --cask firefox
brew install --cask focus
# mas install 1493996622 # Front and Center
brew install --cask gemini
brew install --cask google-chrome
brew install --cask grammarly-desktop
brew install --cask handbrake
brew install --cask hazel
mas install 775737590 # IA Writer
brew install --cask imageoptim
brew install --cask inkscape
brew install --cask iterm2
brew install --cask kaleidoscope
brew install --cask karabiner-elements
brew install --cask kap
brew install --cask keyboard-maestro
mas install 1534275760 # LanguageTool
brew install --cask little-snitch
brew install --cask macupdater
# brew install --cask microsoft-office
mas install 1295203466 # Microsoft Remote Desktop 10
mas install 1289197285 # Mindnode
brew install --cask mullvadvpn
mas install 1464122853 # NextDNS
brew install --cask obsidian
mas install 1346203938 # OmniFocus 3
# brew install --cask parallels
mas install 463362050 # PhotoSweeper
mas install 1289583905 # Pixelmator Pro
brew install --cask raspberry-pi-imager
mas install 1529448980 # Reeder 5
brew install --cask screaming-frog-seo-spider
brew install --cask screenflow
mas install 1518036000 # Sequel Ace
mas install 693112260 # Sim Daltonism
mas install 442168834 # Site Sucker
brew install --cask sketchup
brew install --cask slack
brew install --cask spotify
brew install --cask sublime-text
brew install --cask superduper
brew install --cask taskpaper
mas install 899247664 # TestFlight
mas install 1528890965 # TextSniper
mas install 904280696 # Things 3
brew install --cask ticktick
brew install --cask tower
# TV Pro https://www.totalvalidator.com/downloads/pro.html
# Uniden R Series Tool https://www.uniden.info/download/index.cfm?s=R7
brew install --cask utm
brew install --cask vscodium
mas install 494803304 # WiFi Explorer
brew install --cask zoom
