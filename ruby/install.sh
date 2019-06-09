#!/usr/bin/env bash

echo -e "\\n⬇️  Installing RVM"
curl -L https://get.rvm.io | bash -s stable --ruby --autolibs=enable --auto-dotfiles

echo -e "\\n➡️  Run rvm setup script"
# shellcheck source=/dev/null
source "$HOME/.rvm/scripts/rvm"

echo -e "\\n⬇️  Install global Ruby gems"
gem install bundler
gem install github-pages
