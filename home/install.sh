#!/usr/bin/env bash

current_path=$PWD
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" || exit; pwd -P )

rsync --exclude "install.sh" -avh --no-perms "$parent_path/" "$HOME";

cd "$current_path" || exit
