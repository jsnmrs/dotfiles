#!/usr/bin/env bash

# Find and run all installers.
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" || exit; pwd -P )
cd "$parent_path" || exit

echo -e "\\n🔎 Finding installers\\n"
find . -name "install.sh" | while read -r installer ; do echo "${installer}" ; done
find . -name "configure-*.sh" | while read -r installer ; do echo "${installer}" ; done

echo "";

if [ "${SHELL##/*/}" != "zsh" ];
  then
  read -r -p "⚠️  These install scripts will run. They will overwrite files in your home directory and change OS-level settings. Are you sure? (y/n) " -n 1;
else
  read -r -q "REPLY?⚠️  These install scripts will run. They will overwrite files in your home directory and change OS-level settings. Are you sure? (y/n) ";
fi;

echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo -e "\\n⚙️  Running installers"
  # shellcheck source=/dev/null
  find . -name "install.sh" | while read -r installer ; do source "${installer}" ; done
  # shellcheck source=/dev/null
  find . -name "configure-*.sh" | while read -r installer ; do source "${installer}" ; done
fi;
