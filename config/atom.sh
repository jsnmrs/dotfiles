#!/usr/bin/env bash

echo -e "\\n⬇️  Install Atom packages and themes"
apm install --packages-file "./atom.list"

if [ -f "$HOME/.atom/config.cson" ]; then
  echo -e "\\n🔁  Backup Atom config, copy tracked version"
  mv "$HOME/.atom/config.cson" "$HOME/.atom/config-backup.cson"
  cp "./atom.cson" "$HOME/.atom/config.cson"
fi
