#!/usr/bin/env bash

# Script to sync dotfiles from ./home directory to $HOME,

echo -e "\\n⬇️  Transfer dotfiles to ~/"

current_path="$PWD"

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 || { echo "Error: Failed to determine parent path" >&2; exit 1; }; pwd -P )

# Check if home directory exists
if [ ! -d "$parent_path/home" ]; then
    echo "Error: home directory not found in $parent_path" >&2
    exit 1
fi

if ! rsync -avh --no-perms "$parent_path/home/" "$HOME"; then
    echo "Error: Failed to sync dotfiles" >&2
    exit 1
fi

cd "$current_path" || exit
