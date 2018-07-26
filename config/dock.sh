#!/usr/bin/env bash

# Add new app shortcuts to the dock.
for app in "Google Chrome" \
           "1Password 7" \
           "Fantastical 2" \
           "OmniFocus" \
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
        dockutil --add "/Applications/${app}.app"
    fi
done

# Reload Dock
killall Dock

echo "Done. Missing dock icons are usually fixed by a full restart."

# Clear dock
# dockutil --remove all --no-restart

# Selectively remove apps I don't use from the dock.
# for shortcut_label in "Siri" \
#                       "Launchpad" \
#                       "Safari" \
#                       "Mail" \
#                       "Contacts" \
#                       "Calendar" \
#                       "Notes" \
#                       "Reminders" \
#                       "Maps" \
#                       "Photos" \
#                       "Messages" \
#                       "FaceTime" \
#                       "Pages" \
#                       "Numbers" \
#                       "Keynote" \
#                       "iTunes" \
#                       "iBooks" \
#                       "App Store"; do
#     dockutil --remove "${shortcut_label}" --allhomes --no-restart
# done
