#!/usr/bin/env bash

echo -e "\\n⬇️  Set up Composer, install globals"

current_path=$PWD
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" || exit; pwd -P )

if test ! "$(composer --version)"
  then
  echo -e "\\nComposer not installed"
else
  echo -e "\\n⬇️  Install global Composer libraries"
  rsync --exclude "install.sh" -avh --no-perms "$parent_path/" "$HOME/.composer";

  cd "$HOME/.composer" || exit
  composer update;

  cd "$current_path" || exit
fi
