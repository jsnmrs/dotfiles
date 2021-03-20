#!/usr/bin/env zsh

# Defines untrackesd environment variables.
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.functions" ]] && source "$HOME/.functions"

autoload -U promptinit; promptinit
prompt pure

# Add homebrew to PATH
export PATH="$PATH:/opt/homebrew/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# NVM setup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
