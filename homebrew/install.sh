#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -e "\\n⬇️  Set up Homebrew and install almost everything"

if test ! "$(brew --version)"
  then
  echo -e "\\n⬇️  Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo -e "\\n⭐️ Installed Homebrew! Close all terminal sessions and run this script again."
  exit
else
  echo -e "\\n🔁 Homebrew is installed! Updating instead."
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
brew install rbenv
brew install ruby-build
brew install shellcheck
brew install svgo
brew install webp
brew install yamllint
brew install youtube-dl
brew install zopfli
brew install zsh-autosuggestions

brew tap terrastruct/d2
brew install d2

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
mas install 937984704 # Amphetamine
brew install --cask bartender
brew install --cask calibre
# Canon EOS Webcam https://downloads.canon.com/webcam/EOSWebcamUtilityPro-MAC2.0.pkg.zip
brew install --cask cleanmymac
brew install --cask colour-contrast-analyser
brew install --cask cyberduck
brew install --cask daisydisk
brew install --cask docker
brew install --cask downie
mas install 1099120373 # Exporter
mas install 975937182 # Fantastical
brew install --cask firefox
brew install --cask gemini
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask grammarly-desktop
brew install --cask handbrake
brew install --cask hazel
brew install --cask imageoptim
brew install --cask inkscape
brew install --cask iterm2
brew install --cask kaleidoscope
brew install --cask karabiner-elements
brew install --cask kap
brew install --cask keyboard-maestro
brew install --cask little-snitch
brew install --cask macupdater
brew install --cask microsoft-office
brew install --cask mullvadvpn
mas install 1464122853 # NextDNS
brew install --cask obsidian
mas install 1346203938 # OmniFocus 3
brew install --cask parallels
mas install 639968404 # Parcel
mas install 463362050 # PhotoSweeper
brew install --cask pika
mas install 1289583905 # Photomator Pro
brew install --cask raspberry-pi-imager
mas install 1529448980 # Reeder 5
brew install --cask screaming-frog-seo-spider
brew install --cask screenflow
brew install --cask screens-connect
mas install 1518036000 # Sequel Ace
mas install 1594183810 # Shortery
brew install --cask shottr
mas install 442168834 # Site Sucker
brew install --cask sketchup
brew install --cask slack
brew install --cask spotify
brew install --cask sublime-text
brew install --cask superduper
brew install --cask tower
mas install 1034035493 # TP-Link Kasa
# TV Pro https://www.totalvalidator.com/downloads/pro.html
# Uniden R Series Tool https://www.uniden.info/download/index.cfm?s=R7
mas install 1057750338 # UniFi
brew install --cask visual-studio-code
mas install 494803304 # WiFi Explorer
mas install 1288415553 # Wyze
brew install --cask zoom
