#!/usr/bin/env bash

echo -e "\\n⬇️  Configure Sublime Text"

current_path=$PWD
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" || exit; pwd -P )

cd "$parent_path" || exit

if test ! "$(subl --version)"
  then
  echo -e "\\nSublime Text not installed."
  cd "$current_path" || exit
fi

if [ ! -d "$HOME/Library/Application Support/Sublime Text/Packages/User" ];
  then
  mkdir "$HOME/Library/Application Support/Sublime Text/Packages/User"
fi

# Copy config from repo to Sublime User folder
rsync --exclude "install.sh" -avh --no-perms "$parent_path/" "$HOME/Library/Application Support/Sublime Text/Packages/User/";

cd "$current_path" || exit
