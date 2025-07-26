# Sed script to apply my i3blocks customizations

# Comment out battery section (for desktop use)
/^\[battery\]$/,/^interval=30$/ s/^/# /