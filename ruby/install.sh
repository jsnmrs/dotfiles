#!/usr/bin/env bash

# Initialize rbenv to run now
eval "$(rbenv init -)"

rbenv install "$(rbenv install -l | grep -v - | tail -1)"
rbenv global "$(rbenv install -l | grep -v - | tail -1)"

echo -e "\\n⬇️  Install global Ruby gems"
gem install bundler
gem install github-pages

# if fatal error: 'openssl/ssl.h' file not found, see:
# https://github.com/eventmachine/eventmachine/issues/936
