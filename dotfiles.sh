#!/usr/bin/env bash

# Script to sync dotfiles from the current directory to the home directory,
# excluding the install script itself

echo -e "\\n⬇️  Transfer dotfiles to ~/"

current_path="$PWD"
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" || exit; pwd -P )

if ! rsync -avh --no-perms "$parent_path/home/" "$HOME"; then
    echo "Error: Failed to sync dotfiles" >&2
    exit 1
fi

cd "$current_path" || exit
