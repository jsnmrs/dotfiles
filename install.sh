#!/usr/bin/env bash

echo -e "\\n⬇️  Set up Homebrew"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo -e "\\n⬇️  Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo -e "\\n⭐️ Installed Homebrew! Close all terminal sessions and run this script again."
  exit
fi

echo -e "\\n🔁 Homebrew is installed! Updating instead."
brew update && brew upgrade

# Remove any existing node symlinks that might conflict
brew unlink node 2>/dev/null || true

# Install everything
echo -e "\\n⬇️  Installing everything from Brewfile"
brew bundle --no-lock

# Force link node if needed
brew link --overwrite node 2>/dev/null || true

# Cleanup
brew cleanup

echo -e "\\n✅ Installation complete!"

# Set up Ruby
# Initialize rbenv to run now
eval "$(rbenv init -)"

rbenv install "$(rbenv install -l | grep -v - | tail -1)"
rbenv global "$(rbenv install -l | grep -v - | tail -1)"

echo -e "\\n⬇️  Install global Ruby gems"
gem install bundler
gem install github-pages

# if fatal error: 'openssl/ssl.h' file not found, see:
# https://github.com/eventmachine/eventmachine/issues/936


# Set up Node
echo -e "\\n⬇️  Setup NVM, Node, and global NPM packages"

if test ! "$(nvm --version)"
  then
  echo -e "\\n⬇️  Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi

nvm install node --reinstall-packages-from=node

if test ! "$(npm --version)"
  then
  echo -e "\\nNPM not installed"
else
  echo -e "\\n⬇️  Install global Node modules"
  npm install npm-check-updates --location=global
  npm install npm-check --location=global
  npm install pa11y-ci --location=global
  npm install pa11y-ci-reporter-html --location=global
fi

# Set up Composer
echo -e "\\n⬇️  Set up Composer, install globals"

if test ! "$(composer --version)"
  then
  echo -e "\\nComposer not installed"
else
  echo -e "\\n⬇️  Install global Composer libraries"
  rsync -avh --no-perms "composer.json" "$HOME/.composer";

  cd "$HOME/.composer" || exit
  composer update;

  cd "$current_path" || exit
fi
