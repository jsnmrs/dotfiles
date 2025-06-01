# Jason’s dotfiles

These are the dotfiles and scripts that I use to setup and maintain my macOS-based devices.

- [Jason’s dotfiles](#jasons-dotfiles)
  - [Step zero](#step-zero)
  - [Getting started, using Git](#getting-started-using-git)
  - [Establishing dotfiles](#establishing-dotfiles)
  - [Install "all the things" script](#install-all-the-things-script)
  - [Housekeeping](#housekeeping)
  - [Inspired by](#inspired-by)

## Step zero

**On a new machine or fresh macOS install:** before you can do much on the command line (like using `git`), Xcode Command Line Tools need to be installed and the license agreed to.

1. Open Applications > Utilites > Terminal
2. Install Xcode Command Line Tools `xcode-select --install`
3. Click install, agree to license

## Getting started, using Git

You can clone this repository wherever you want. I like to keep it in `~/Projects/dotfiles`.

```bash
git clone https://github.com/jsnmrs/dotfiles.git && cd dotfiles
```

## Establishing dotfiles

The [dotfiles.sh script](https://github.com/jsnmrs/dotfiles/blob/main/dotfiles.sh) will run a copy all of the dotfiles (.\*) in `home/` into to your `$HOME` folder. The script creates backups of replaced files in a timestamped `~/dotfiles-YYYY-MM-DD-HHMMSS` folder.

**Run it:** `source dotfiles.sh`

## Install "all the things" script

The [install.sh](https://github.com/jsnmrs/dotfiles/blob/main/install.sh) script will:

1. Install (or update) Homebrew
2. Install everything from Brewfile (formulae, fonts, casks, Mac App Store apps via `mas`)
3. Set up Ruby via rbenv
   - Install latest stable Ruby version
   - Install global Ruby gems (bundler, github-pages)
4. Set up Node via NVM
   - Install latest stable Node.js
   - Install global Node modules (npm-check-updates, npm-check, pa11y-ci, pa11y-ci-reporter-html)
5. Set up Composer
   - Copy composer.json into `~/.composer`
   - Run composer update
6. Install Docksal
7. Configure macOS dock icons and spacers
8. Configure extensive macOS system preferences including:
   - Security & privacy settings
   - Mouse & keyboard preferences
   - Finder settings
   - Safari settings
   - Terminal & iTerm2 settings
   - System update preferences
   - And many other system-level configurations

**Run it:** `source install.sh`

## Housekeeping

- `brew list` – list installed Homebrew formulae, including casks
- `mas list` – list installed applications from Mac App Store
- `npm list -g [--depth=0]` – list globally installed node modules
- `gem query --local` – list locally installed Ruby gems
- `composer global show` – list globally installed Composer packages

## Inspired by

- [Mathias Bynens’ dotfiles repo](https://mths.be/dotfiles)
- [Kevin Deldycke’s dotfiles repo](https://github.com/kdeldycke/dotfiles)
- [Paul Irish’s dotfiles repo](https://github.com/paulirish/dotfiles/)
- [Paul Miller’s dotfiles repo](https://github.com/paulmillr/dotfiles)
- [Matt Brictson’s dotfiles repo](https://github.com/mattbrictson/dotfiles)
- [Stephan Judis’ dotfiles repo](https://github.com/stefanjudis/dotfiles/)
- [Change macOS user preferences via command line by Pawel Grzybek](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/)
- [Jesse Vincent's .claude configuration](https://github.com/obra/dotfiles/tree/main/.claude)
- [Harper Reed's .claude configuration](https://github.com/harperreed/dotfiles/tree/master/.claude)
