#!/usr/bin/env bash

echo -e "\n⬇️  Install RVM"
curl -L https://get.rvm.io | bash -s stable --ruby --autolibs=enable --auto-dotfiles

echo -e "\n➡️  Run RVM setup script"
source $HOME/.rvm/scripts/rvm

echo -e "\n⬇️  Install global Ruby gems"
gem install bundler
gem install github-pages
