#!/usr/bin/env bash

echo -e "\\n⬇️  Setup NVM, Node, and global NPM packages"

if test ! "$(nvm --version)"
  then
  echo -e "\\n⬇️  Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi

nvm install node --reinstall-packages-from=node

if test ! "$(npm --version)"
  then
  echo -e "\\nNPM not installed"
else
  echo -e "\\n⬇️  Install global Node modules"
  npm install depcheck --location=global
  npm install npm-check-updates --location=global
  npm install npm-check --location=global
  npm install pa11y-ci --location=global
  npm install pa11y-ci-reporter-html --location=global
fi
