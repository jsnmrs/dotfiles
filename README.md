# Jason’s dotfiles

These are the dotfiles and scripts that I use to setup and maintain my Mac.

- [Step 0](#new-machine-or-fresh-macos-install)
- [Getting started, using Git](#getting-started-using-git)
- [Configuring Atom with `atom.sh`](#configuring-atom-with-atomsh)
- [Establishing dotfiles with `bootstrap.sh`](#establishing-dotfiles-with-bootstrapsh)
- [Housekeeping](#housekeeping)
- [Inspiration](#inspired-by)

## New machine or fresh macOS install

Before you can do much on the command line (like using Git), Xcode Command Line Tools need to be installed and the license agreed to.

1. Open Applications > Utilites > Terminal
2. Install Xcode Command Line Tools `xcode-select --install`
3. Click install, agree to license

## Getting started, using Git

You can clone the repository wherever you want. I like to keep it in `~/Projects/dotfiles`.

```bash
git clone https://github.com/jsnmrs/dotfiles.git && cd dotfiles
```

## Configuring Atom with `atom.sh`

The [`atom.sh`](https://github.com/jsnmrs/dotfiles/blob/master/atom/atom.sh) script will:

1. Install a [list of packages and themes](https://github.com/jsnmrs/dotfiles/blob/master/atom/packages.list)
2. Create a backup of `~/.atom/config.cson` as `~/.atom/config-backup.cson`
3. Copy the [config.cson from this repo](https://github.com/jsnmrs/dotfiles/blob/master/atom/config.cson) into `~/.atom/`.

**Run it:** `source ./atom/atom.sh`


1. [brew.sh](https://github.com/jsnmrs/dotfiles/blob/master/lib/brew.sh) — installs (or updates) Homebrew, installs a list of Homebrew formulae
2. [cask.sh](https://github.com/jsnmrs/dotfiles/blob/master/lib/cask.sh) — installs a list of fonts, applications, and Mac App Store Applications
3. [node.sh](https://github.com/jsnmrs/dotfiles/blob/master/lib/node.sh) — installs a list of Node modules globally
4. [ruby.sh](https://github.com/jsnmrs/dotfiles/blob/master/lib/ruby.sh) — installs [RVM](https://rvm.io) and a list of Ruby gems
6. [macos.sh](https://github.com/jsnmrs/dotfiles/blob/master/lib/macos.sh) — sets some sensible macOS defaults, forked and customized from [Kevin Deldycke’s macos-config.sh](https://github.com/kdeldycke/dotfiles/blob/master/scripts/macos-config.sh)

Looking through the files and scripts in `lib/` before running install.sh is definitely recommended.

**Run it:** `source install.sh`

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
