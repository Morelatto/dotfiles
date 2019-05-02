tmpbg="/tmp/screen.png"
scrot "$tmpbg"; corrupter -mag 4 -boffset 15 -seed 1 "$tmpbg" "$tmpbg"
i3lock -i "$tmpbg"; rm "$tmpbg"