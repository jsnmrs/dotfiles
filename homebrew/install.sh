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
brew install openssl
brew install pure
brew install qemu
brew install rbenv
brew install ruby-build
brew install shellcheck
brew install webp
brew install youtube-dl
brew install zopfli
brew install zsh-autosuggestions

echo -e "\\n⬇️  Installing fonts"

brew tap homebrew/cask-fonts

brew install --cask font-atkinson-hyperlegible
brew install --cask font-ia-writer-mono
brew install --cask font-ia-writer-duo
brew install --cask font-ia-writer-quattro
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
brew install --cask calibre
brew install --cask cleanmymac
brew install --cask cleanshot
brew install --cask colour-contrast-analyser
brew install --cask cyberduck
brew install --cask daisydisk
brew install --cask docker
brew install --cask downie
mas install 1099120373 # Exporter
mas install 975937182 # Fantastical
brew install --cask firefox
brew install --cask firefox@developer-edition
brew install --cask gemini
brew install --cask github
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask grammarly-desktop
brew install --cask handbrake
mas install 1452453066 # Hidden Bar
brew install --cask imageoptim
brew install --cask inkscape
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask keyboard-maestro
brew install --cask lm-studio
brew install --cask macai
brew install --cask macupdater
brew install --cask macwhisper
brew install --cask mullvadvpn
mas install 1505432629 # NotePlan
brew install --cask obsidian
brew install --cask ollama
mas install 1542143627 # OmniFocus 4
brew install --cask parallels
mas install 639968404 # Parcel
mas install 1444998321 # Permute 3
mas install 463362050 # PhotoSweeper
brew install --cask piezo
brew install --cask pika
mas install 1289583905 # Pixelmator Pro
brew install --cask polypane
brew install --cask raycast
mas install 1529448980 # Reeder 5
brew install --cask screaming-frog-seo-spider
brew install --cask screenflow
mas install 1518036000 # Sequel Ace
mas install 442168834 # Site Sucker
brew install --cask slack
brew install --cask spotify
mas install 6471380298 # Stop the Madness Pro
brew install --cask superduper
brew install --cask tower
brew install --cask visual-studio-code
brew install --cask zoom
