#!/usr/bin/env zsh

# Defines untrackesd environment variables.
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.functions" ]] && source "$HOME/.functions"

autoload -U promptinit; promptinit
prompt pure

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
