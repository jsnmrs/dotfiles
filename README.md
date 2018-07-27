# Jason’s dotfiles [![Build Status](https://travis-ci.org/jsnmrs/dotfiles.svg?branch=master)](https://travis-ci.org/jsnmrs/dotfiles)

These are the dotfiles and scripts that I use to setup and maintain my Mac.

![Mac OS X 10.13 High Sierra with Solarized Dark terminal](https://raw.githubusercontent.com/jsnmrs/dotfiles/master/config/screenshot.jpg)

- [Step zero](#step-zero)
- [Getting started, using Git](#getting-started-using-git)
- [Establishing dotfiles with `bootstrap.sh`](#establishing-dotfiles-with-bootstrapsh)
    - [Add private commands and settings to `.extra`](#add-private-commands-and-settings-to-extra)
- [Install scripts](#install-scripts)
    - [Installing Homebrew and binaries with `brew.sh`](#installing-homebrew-and-binaries-with-brewsh)
    - [Installing applications with `cask.sh`](#installing-applications-with-casksh)
    - [Installing global Node modules with `node.sh`](#installing-global-node-modules-with-nodesh)
    - [Installing RVM and Ruby gems `ruby.sh`](#installing-rvm-and-ruby-gems-rubysh)
    - [Configuring Atom with `atom.sh`](#configuring-atom-with-atomsh)
    - [Setting macOS defaults with `macos.sh`](#setting-macos-defaults-with-macossh)
    - [Configure macOS dock icons with `dock.sh`](#configure-macos-dock-icons-with-docksh)
- [Housekeeping](#housekeeping)
- [Inspiration](#heavily-inspired-by)

## Step zero

**On a new machine or fresh macOS install:** before you can do much on the command line (like using Git), Xcode Command Line Tools need to be installed and the license agreed to.

1. Open Applications > Utilites > Terminal
2. Install Xcode Command Line Tools `xcode-select --install`
3. Click install, agree to license

## Getting started, using Git

You can clone the repository wherever you want. I like to keep it in `~/Projects/dotfiles`.

```bash
git clone https://github.com/jsnmrs/dotfiles.git && cd dotfiles
```

## Establishing dotfiles with `bootstrap.sh`

The [bootstrap.sh script](https://github.com/jsnmrs/dotfiles/blob/master/bootstrap.sh) will run a git pull and copy all of the dotfiles (.\*) from the root of this directory into to your home folder.

Take a look through the dotfiles (.\*) before running bootstrap.sh to make any adjustments. The script will warn that files in your home folder will be overwritten.

**Run it:** `source bootstrap.sh`

### Add private commands and settings to `.extra`

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add commands and settings you don’t want to commit to a public repository. My `~/.extra` looks something like this:

```bash
# Git credentials
GIT_AUTHOR_NAME="Jason Morris"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="jason@mailinator.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Project aliases
alias clientsite="cd ~/Projects/clientsite"
alias businesspapers="cd ~/Projects/my/important/business/papers"

# Access tokens
export APItoken=0000ffff0000ffff0000ffff0000ffff0000ffff
```

## Install scripts

### Installing Homebrew and binaries with `brew.sh`

The [brew.sh](https://github.com/jsnmrs/dotfiles/blob/master/config/brew.sh) script will install (or update) Homebrew, then install a list of Homebrew formulae.

**Run it:** `source ./config/brew.sh`

### Installing applications with `cask.sh`

The [cask.sh](https://github.com/jsnmrs/dotfiles/blob/master/config/cask.sh) script will:

1. Install (or update) Homebrew
2. Install a short list of applications and fonts via cask
3. Running script with `--full` or `-f` option will install a larger list of Applications

**Run it:** `source ./config/cask.sh [--full]`

### Installing global Node modules with `node.sh`

The [node.sh](https://github.com/jsnmrs/dotfiles/blob/master/config/node.sh) script will install (or update) a list of global Node modules.

**Run it:** `source ./config/node.sh`

### Installing RVM and Ruby gems `ruby.sh`

The [ruby.sh](https://github.com/jsnmrs/dotfiles/blob/master/config/ruby.sh) script will:

1. Install (or update) [RVM](https://rvm.io)
2. Run RVM setup script
3. Install list of Ruby gems

**Run it:** `source ./config/ruby.sh`

### Configuring Atom with `atom.sh`

The [`atom.sh`](https://github.com/jsnmrs/dotfiles/blob/master/config/atom.sh) script will:

1. Install a [list of packages and themes](https://github.com/jsnmrs/dotfiles/blob/master/config/atom.list)
2. Create a backup of `~/.atom/config.cson` as `~/.atom/config-backup.cson`
3. Copy the [atom.cson from this repo](https://github.com/jsnmrs/dotfiles/blob/master/config/atom.cson) to `~/.atom/config.cson`.

**Run it:** `source ./config/atom.sh`

### Setting macOS defaults with `macos.sh`

The [macos.sh](https://github.com/jsnmrs/dotfiles/blob/master/config/macos.sh) script is a blend of [Kevin Deldycke’s macos-config.sh](https://github.com/kdeldycke/dotfiles/blob/master/scripts/macos-config.sh) and [Mathias Bynens’ .macos](https://mths.be/macos) scripts. It sets a number of sensible defaults for macOS 10.13. Tip: review and comment out uncertain commands before running.

**Run it:** `source ./config/macos.sh`

### Configure macOS dock icons with `dock.sh`

The [dock.sh](https://github.com/jsnmrs/dotfiles/blob/master/config/dock.sh) script uses [dockutil](https://github.com/kcrawford/dockutil) to add specified application icons to the dock. Running script with `--clear` or `-c` option will completely clear the existing dock.

**Run it:** `source ./config/dock.sh [--clear]`

## Housekeeping

- `brew leaves` – list installed Homebrew formulae
- `brew cask list` – list installed Homebrew casks
- `npm list -g --depth=0` – list globally installed node modules
- `gem query --local` – list locally installed Ruby gems
- `apm list -i` – list installed Atom plugins and themes

## Heavily inspired by

- [Mathias Bynens’ dotfiles repo](https://mths.be/dotfiles)
- [Kevin Deldycke’s dotfiles repo](https://github.com/kdeldycke/dotfiles)
- [Paul Irish’s dotfiles repo](https://github.com/paulirish/dotfiles/)
