#!/usr/bin/env bash

if test ! "$(python3 --version)"
  then
  echo -e "\\n Python 3 not installed"
else
  echo -e "\\n⬇️  Installing Python packages"
  pip3 install trufflehog
fi
