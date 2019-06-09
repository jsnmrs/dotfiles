# Jason’s dotfiles [![Build Status](https://travis-ci.org/jsnmrs/dotfiles.svg?branch=master)](https://travis-ci.org/jsnmrs/dotfiles)

These are the dotfiles and scripts that I use to setup and maintain my Mac.

![macOS 10.14 Mojave desktop with Snazzy iTerm window](https://raw.githubusercontent.com/jsnmrs/dotfiles/master/assets/screenshot.jpg)

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

## Establishing dotfiles

The [home/install.sh script](https://github.com/jsnmrs/dotfiles/blob/master/home/install.sh) will run a copy all of the dotfiles (.\*) in `home/` into to your home folder.

Take a look through [the dotfiles (.\*)](https://github.com/jsnmrs/dotfiles/blob/master/home/) before running bootstrap.sh to make any adjustments. The script will warn that files in your home folder will be overwritten.

**Run it:** `source home/install.sh`

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

### Installing Homebrew, binaries, and applications

The [homebrew/install.sh](https://github.com/jsnmrs/dotfiles/blob/master/homebrew/install.sh) script will:

1. Install (or update) Homebrew
2. Install a list of Homebrew formulae
3. Install a list of fonts via Homebrew cask
4. Install a list of Mac App Store applications via `mas`
5. Install a list of applications via Homebrew Cask

**Run it:** `source homebrew/install.sh`

### Installing NVM and global Node modules

The [node/install.sh](https://github.com/jsnmrs/dotfiles/blob/master/node/install.sh) script will:

1. Install (or update) [NVM](https://github.com/nvm-sh/nvm)
2. Install (or update to) the latest stable version of Node.js
3. Install list of global Node modules.

**Run it:** `source node/install.sh`

### Installing RVM and Ruby gems

The [ruby/install.sh](https://github.com/jsnmrs/dotfiles/blob/master/ruby/install.sh) script will:

1. Install (or update) [RVM](https://rvm.io)
2. Run RVM setup script
3. Install list of Ruby gems

**Run it:** `source ruby/install.sh`

### Configuring Atom

The [`atom/install.sh`](https://github.com/jsnmrs/dotfiles/blob/master/atom/install.sh) script will:

1. Create a backup of `~/.atom/config.cson` as `~/.atom/config-backup.cson`
2. Copy the [config.cson from this repo](https://github.com/jsnmrs/dotfiles/blob/master/atom/config.cson) to `~/.atom/config.cson`.
3. Install a [list of packages and themes](https://github.com/jsnmrs/dotfiles/blob/master/atom/packages.list)

**Run it:** `source atom/install.sh`

### Setting macOS defaults

The [macos/configure-macos.sh](https://github.com/jsnmrs/dotfiles/blob/master/macos/configure-macos.sh) script is a blend of [Kevin Deldycke’s macos-config.sh](https://github.com/kdeldycke/dotfiles/blob/master/scripts/macos-config.sh) and [Mathias Bynens’ .macos](https://mths.be/macos) scripts. It sets a number of sensible defaults for macOS 10.14. Tip: review and comment out uncertain commands before running.

**Run it:** `source macos/configure-macos.sh`

### Configure macOS dock icons

The [macos/configure-dock.sh](https://github.com/jsnmrs/dotfiles/blob/master/macos/configure-dock.sh) script will clear and add specific application icons to the dock.

**Run it:** `source macos/configure-dock.sh`

## Housekeeping

- `brew leaves` – list installed Homebrew formulae
- `brew cask list` – list installed Homebrew casks
- `mas list` – list installed applications from Mac App Store
- `npm list -g --depth=0` – list globally installed node modules
- `gem query --local` – list locally installed Ruby gems
- `apm list -i` – list installed Atom plugins and themes

## Heavily inspired by

- [Mathias Bynens’ dotfiles repo](https://mths.be/dotfiles)
- [Kevin Deldycke’s dotfiles repo](https://github.com/kdeldycke/dotfiles)
- [Paul Irish’s dotfiles repo](https://github.com/paulirish/dotfiles/)
- [Paul Miller’s dotfiles repo](https://github.com/paulmillr/dotfiles)
