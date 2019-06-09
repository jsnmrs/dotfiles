#!/usr/bin/env bash

current_path=$PWD
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" || exit; pwd -P )

cd "$parent_path" || exit

if test ! "$(apm --version)"
  then
  echo -e "\\nAtom not installed."
else
  if [ -f "$HOME/.atom/config.cson" ];
  then
    echo -e "\\n🗄  Backup existing Atom config.cson"
    mv "$HOME/.atom/config.cson" "$HOME/.atom/config-backup.cson"
  fi
  echo -e "\\n✨ Replace Atom config.cson"
  cp "config.cson" "$HOME/.atom/config.cson"

  echo -e "\\n⬇️  Install Atom packages and themes"
  apm install --packages-file "packages.list"
fi

cd "$current_path" || exit
