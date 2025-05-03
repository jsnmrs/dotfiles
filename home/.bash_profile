#!/bin/bash

# Add to PATH
# Local user binaries take highest precedence
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# Local system admin binaries
[ -d "/usr/local/sbin" ] && PATH="/usr/local/sbin:$PATH"

# Composer binaries
[ -d "$HOME/.composer/vendor/bin" ] && PATH="$PATH:$HOME/.composer/vendor/bin"

# Finally, export the modified PATH
export PATH

# Load Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1;

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Set up RVM
source $HOME/.rvm/scripts/rvm;

# Set up NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
