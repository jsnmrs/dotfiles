#!/usr/bin/env bash

source ./lib/brew.sh
source ./lib/cask.sh
source ./lib/node.sh
source ./lib/ruby.sh
source ./lib/atom.sh
source ./lib/macos.sh

echo -e "\\n🌎  Set Chrome as the default browser"
duti -s com.google.Chrome http

echo -e "\\n🙌  All done!"
