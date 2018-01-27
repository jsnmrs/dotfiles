#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function dotsync() {
  rsync --exclude ".git/" \
        --exclude "lib/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "install.sh" \
        --exclude "LICENSE.md" \
        --exclude "README.md" \
        -avh --no-perms . ~;
  # shellcheck source=/dev/null
  source ~/.bash_profile;
}

read -r -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  dotsync;
fi;
unset dotsync;
