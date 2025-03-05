#!/usr/bin/env bash

# Script to sync dotfiles from ./home directory to $HOME,
# creating backups of replaced files in ~/dotfiles-YYYY-MM-DD-HHMMSS

# Create timestamp for backup directory
backup_date=$(date +%Y-%m-%d-%H%M%S)
backup_dir="$HOME/dotfiles-$backup_date"

echo -e "\\n⬇️  Transfer dotfiles to ~/ (with backups in $backup_dir)"

current_path="$PWD"

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 || { echo "Error: Failed to determine parent path" >&2; exit 1; }; pwd -P )

# Check if home directory exists
if [ ! -d "$parent_path/home" ]; then
    echo "Error: home directory not found in $parent_path" >&2
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Use rsync with backup options
if ! rsync -avh --no-perms --backup --backup-dir="$backup_dir" "$parent_path/home/" "$HOME"; then
    echo "Error: Failed to sync dotfiles" >&2
    exit 1
fi

# Remove backup directory if empty
if [ -z "$(ls -A "$backup_dir")" ]; then
    rmdir "$backup_dir"
    echo "No files were replaced (backup directory removed)"
fi

cd "$current_path" || exit
