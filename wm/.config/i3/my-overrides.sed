# Sed script to apply my customizations to EndeavourOS base config
# This modifies specific lines in the base config

# 1. Comment out set_once.sh
s/^exec --no-startup-id ~\/set_once.sh/# exec --no-startup-id ~\/set_once.sh/

# 2. Change screenshot path
s|scrot ~/%Y-%m-%d-%T-screenshot.png|scrot ~/Pictures/%Y-%m-%d-%T-screenshot.png|

# 3. Change workspace labels  
s/set \$ws4 "4:"/set \$ws4 "4:"/
s/set \$ws5 "5:"/set \$ws5 "5"/

# 4. Comment out default app assignments
s/^assign \[class="Xfce4-terminal"\] \$ws1/# assign [class="Xfce4-terminal"] \$ws1/
s/^assign \[class="(?i)firefox"\] \$ws2/# assign [class="(?i)firefox"] \$ws2/

# 5. Change wallpaper path
s|feh --bg-fill /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png|feh --bg-fill /home/storm/Pictures/445f6909-d89b-434c-920c-8768c717ac35.png|

# 6. Enable autotiling
s/^#exec_always --no-startup-id autotiling/exec_always --no-startup-id autotiling/

# 7. Replace autostart apps
s|^exec --no-startup-id sleep 7 && firefox https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/main/force-knowledge.md|exec --no-startup-id sleep 2 \&\& i3-msg workspace \$ws1 \&\& pycharm\nexec --no-startup-id sleep 7 \&\& i3-msg workspace \$ws2 \&\& firefox|