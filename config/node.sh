#!/usr/bin/env bash

if ! npm --version >/dev/null 2>&1
  then
  echo -e "\\n⚠️  npm not installed"
else
  echo -e "\\n⬇️  Install global Node modules"
  npm install -g git-standup
  npm install -g grunt-cli
  npm install -g gulp-cli
  npm install -g npm-check-updates
fi
