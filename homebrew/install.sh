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
