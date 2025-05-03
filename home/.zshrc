#!/usr/bin/env zsh

# Source additional configuration files
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.functions" ]] && source "$HOME/.functions"

# History configuration
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000
export HISTCONTROL='ignoreboth'
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Homebrew configuration
export HOMEBREW_NO_ANALYTICS=1
export PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.composer/vendor/bin"
fpath+=/opt/homebrew/share/zsh/site-functions

# Load Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Load zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Prompt configuration
autoload -U promptinit; promptinit
prompt pure

# Node.js configuration
export NODE_OPTIONS="--max-old-space-size=4096"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 1Password SSH configuration
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
