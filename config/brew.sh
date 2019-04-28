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

echo -e "\\n⬇️  Installing Homebrew formulae"

brew install ack
brew install chrome-cli
brew install cmake
brew install composer
brew install coreutils
brew install dockutil
brew install git
brew install git-lfs
brew install libyaml
brew install mas
brew install mysql
brew install node
brew install nvm
mkdir "$HOME/.nvm"
brew install openssh
brew install openssl@1.1
brew install phantomjs
brew install shellcheck
brew install trash
brew install tree
brew install yarn
