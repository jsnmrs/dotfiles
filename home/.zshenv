# Add to PATH
export PATH="$HOME/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";
export PATH="$PATH:$HOME/.composer/vendor/bin";

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

# Set Atom to default editor
export EDITOR='atom -w'

# Set up NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
