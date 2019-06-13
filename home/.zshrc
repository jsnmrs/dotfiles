#!/usr/bin/env zsh

# Defines untrackesd environment variables.
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.functions" ]] && source "$HOME/.functions"

autoload -U promptinit; promptinit
prompt pure
