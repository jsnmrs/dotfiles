#!/usr/bin/env zsh

# Defines untrackesd environment variables.
extra="$HOME/.extra"
[[ -f "$extra" ]] && source $extra

aliases="$HOME/.aliases"
[[ -f "$aliases" ]] && source $aliases

functions="$HOME/.functions"
[[ -f "$functions" ]] && source $functions

autoload -U promptinit; promptinit
prompt pure
