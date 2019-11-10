#!/usr/bin/env bash

current_path=$PWD
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" || exit; pwd -P )

cd "$parent_path" || exit

if test ! "$(subl --version)"
  then
  echo -e "\\nSublime Text not installed."
  cd "$current_path" || exit
fi

if [ ! -d "$HOME/.sublime/" ];
  then
  mkdir "$HOME/.sublime/"
fi

if [ ! -d "$HOME/Library/Application Support/Sublime Text 3/Packages/User" ];
  then
  mkdir "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
fi

# Copy config from repo to ~/.sublime
rsync --exclude "install.sh" -avh --no-perms "$parent_path/" "$HOME/.sublime/";

# Copy contents of existing Sublime Text user folder to ~/.sublime
cp -R "$HOME/Library/Application Support/Sublime Text 3/Packages/User" "$HOME/.sublime"

# Delete existing Sublime Text user folder
rm -rf "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

# Create symlink from default user folder location to ~/.sublime
ln -s "$HOME/.sublime" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

cd "$current_path" || exit
