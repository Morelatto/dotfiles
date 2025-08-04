#!/bin/sh
# Screen timeout and DPMS settings

# Screen saver timeout (in seconds)
# 1800 = 30 minutes before screen lock
xset s 1800

# DPMS (Display Power Management Signaling) 
# Standby, Suspend, Off (in seconds)
# 2400 = 40 minutes, 3000 = 50 minutes, 3600 = 60 minutes
xset dpms 2400 3000 3600

# Disable screen blanking (optional, uncomment if needed)
# xset s noblank

# Mouse acceleration (optional)
# xset m 2 1