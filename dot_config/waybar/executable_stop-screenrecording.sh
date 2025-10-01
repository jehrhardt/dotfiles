#!/usr/bin/env bash

if pgrep -x wl-screenrec >/dev/null || pgrep -x wf-recorder >/dev/null; then
  pkill -x wl-screenrec
  pkill -x wf-recorder

  notify-send "Screen recording saved to $OUTPUT_DIR" -t 2000

  sleep 0.2 # ensures the process is actually dead before we check
  pkill -RTMIN+8 waybar
fi
