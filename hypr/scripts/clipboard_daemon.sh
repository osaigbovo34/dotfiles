#!/bin/bash
# Start the wl-paste daemons in the background for persistence
wl-paste -t text --watch cliphist store &
wl-paste -t image --watch cliphist store &
