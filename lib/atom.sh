#!/usr/bin/env bash

echo -e "\n⬇️  Install Atom packages and themes"
apm install --packages-file "./lib/atom.txt"

if [ -f "$HOME/.atom/config.cson" ]; then
  echo -e "\n🔁  Backup Atom config, copy tracked version"
  mv $HOME/.atom/config.cson $HOME/.atom/config-backup.cson
  cp ./lib/config.cson $HOME/.atom/
fi
