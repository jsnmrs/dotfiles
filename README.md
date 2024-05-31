# Jason’s dotfiles

These are the dotfiles and scripts that I use to setup and maintain my Mac.

![macOS 13 Ventura desktop with iTerm prompt](https://raw.githubusercontent.com/jsnmrs/dotfiles/main/assets/screenshot.jpg)

- [Jason’s dotfiles](#jasons-dotfiles)
  - [Step zero](#step-zero)
  - [Getting started, using Git](#getting-started-using-git)
  - [Establishing dotfiles](#establishing-dotfiles)
    - [Add private commands and settings to `.extra`](#add-private-commands-and-settings-to-extra)
  - [Install scripts](#install-scripts)
    - [Installing Homebrew, binaries, and applications](#installing-homebrew-binaries-and-applications)
    - [Installing NVM and global Node modules](#installing-nvm-and-global-node-modules)
    - [Installing RVM and Ruby gems](#installing-rvm-and-ruby-gems)
    - [Installing Composer packages](#installing-composer-packages)
    - [Setting macOS defaults](#setting-macos-defaults)
    - [Configure macOS dock icons](#configure-macos-dock-icons)
  - [Housekeeping](#housekeeping)
  - [Heavily inspired by](#heavily-inspired-by)

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

The [home/install.sh script](https://github.com/jsnmrs/dotfiles/blob/main/home/install.sh) will run a copy all of the dotfiles (.\*) in `home/` into to your home folder.

Take a look through [the dotfiles (.\*)](https://github.com/jsnmrs/dotfiles/blob/main/home/) before running bootstrap.sh to make any adjustments. The script will warn that files in your home folder will be overwritten.

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

The [homebrew/install.sh](https://github.com/jsnmrs/dotfiles/blob/main/homebrew/install.sh) script will:

1. Install (or update) Homebrew
2. Install a list of Homebrew formulae
3. Install a list of fonts via Homebrew cask
4. Install a list of Mac App Store applications via `mas`
5. Install a list of applications via Homebrew Cask

**Run it:** `source homebrew/install.sh`

### Installing NVM and global Node modules

The [node/install.sh](https://github.com/jsnmrs/dotfiles/blob/main/node/install.sh) script will:

1. Install (or update) [NVM](https://github.com/nvm-sh/nvm)
2. Install (or update to) the latest stable version of Node.js
3. Install list of global Node modules.

**Run it:** `source node/install.sh`

### Installing RVM and Ruby gems

The [ruby/install.sh](https://github.com/jsnmrs/dotfiles/blob/main/ruby/install.sh) script will:

1. Install (or update) [RVM](https://rvm.io)
2. Run RVM setup script
3. Install list of Ruby gems

**Run it:** `source ruby/install.sh`

### Installing Composer packages

The [composer/install.sh](https://github.com/jsnmrs/dotfiles/blob/main/composer/install.sh) script will:

1. Check for Composer installation
2. Copy composer.json into `/.composer`
3. Run `composer update`

**Run it:** `source composer/install.sh`

### Setting macOS defaults

The [macos/configure-macos.sh](https://github.com/jsnmrs/dotfiles/blob/main/macos/configure-macos.sh) script is a blend of [Kevin Deldycke’s macos-config.sh](https://github.com/kdeldycke/dotfiles/blob/main/macos-config.sh) and [Mathias Bynens’ .macos](https://github.com/mathiasbynens/dotfiles/blob/main/.macos) scripts. It sets a number of sensible defaults for macOS. Tip: review and comment out uncertain commands before running.

**Run it:** `source macos/configure-macos.sh`

### Configure macOS dock icons

The [macos/configure-dock.sh](https://github.com/jsnmrs/dotfiles/blob/main/macos/configure-dock.sh) script will clear and add specific application icons to the dock.

**Run it:** `source macos/configure-dock.sh`

## Housekeeping

- `brew list` – list installed Homebrew formulae, including casks
- `mas list` – list installed applications from Mac App Store
- `npm list -g [--depth=0]` – list globally installed node modules
- `gem query --local` – list locally installed Ruby gems
- `composer global show` – list globally installed Composer packages

## Heavily inspired by

- [Mathias Bynens’ dotfiles repo](https://mths.be/dotfiles)
- [Kevin Deldycke’s dotfiles repo](https://github.com/kdeldycke/dotfiles)
- [Paul Irish’s dotfiles repo](https://github.com/paulirish/dotfiles/)
- [Paul Miller’s dotfiles repo](https://github.com/paulmillr/dotfiles)
- [Matt Brictson’s dotfiles repo](https://github.com/mattbrictson/dotfiles)
- [Stephan Judis’ dotfiles repo](https://github.com/stefanjudis/dotfiles/)
- [Change macOS user preferences via command line by Pawel Grzybek](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/)
