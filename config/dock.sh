#!/usr/bin/env bash

# Check for dockutil
if ! dockutil --version >/dev/null 2>&1
  then
  brew install dockutil
else
  echo -e "\\ndockutil is installed"
fi

# Flag for completely clearing existing dock
if [ "$1" == "--clear" ] || [ "$1" == "-c" ]; then
  echo -e "clearing existing dock icons"
  dockutil --remove all --no-restart
fi;

# Add new app shortcuts to the dock.
for app in "Google Chrome" \
           "1Password 7" \
           "Fantastical 2" \
           "OmniFocus" \
           "TickTick" \
           "Notes" \
           "Slack" \
           "Microsoft Outlook" \
           "iTerm" \
           "Atom" \
           "Tower" \
           "Spotify" \
           "Messages"; do
    if ! dockutil --find "${app}"
    then
        dockutil --add "/Applications/${app}.app" --no-restart
    fi
done

killall Dock

echo -e "\\nDone. Missing dock icons are usually fixed by a full restart."
