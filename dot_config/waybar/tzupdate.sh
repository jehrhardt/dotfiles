#!/usr/bin/env bash

notify-send "   Updating time and timezone..."
sudo systemctl restart systemd-timesyncd
sudo tzupdate
new_timezone=$(timedatectl show -p Timezone --value)
pkill -x waybar
setsid waybar >/dev/null 2>&1 &
notify-send "   Time updated and timezone set to $new_timezone"
