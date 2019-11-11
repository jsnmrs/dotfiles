# Add to PATH
export PATH="$HOME/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";
export PATH="$PATH:$HOME/.composer/vendor/bin";

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1;

# timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
export HISTTIMEFORMAT='%F %T ';

# Increase history size.
export HISTSIZE='100000';
export HISTFILESIZE="${HISTSIZE}";

# Append to history, don't overwrite it.
which shopt > /dev/null && shopt -s histappend

# Increase history size.
export HISTSIZE='100000';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Set Atom to default editor
export EDITOR='subl -w'

# Set up NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
