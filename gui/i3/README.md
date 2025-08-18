# i3 Window Manager Configuration Reference Guide

## Overview

This guide explains the i3 window manager configuration, providing a comprehensive reference for understanding and using
this tiling window manager setup.

### Component Purposes

- **config**: Main i3 window manager configuration with all keybindings and rules
- **i3blocks/**: Status bar configuration and modules
- **i3wsr/**: Automatic workspace naming with application icons
- **i3grid/**: Grid-based window positioning and management tool
- **scripts/**: Utility scripts for system monitoring and controls

## Additional Components

### i3wsr - Workspace Naming
- Automatically renames workspaces based on running applications
- Shows FontAwesome icons for visual identification
- Configuration includes icons for Firefox, terminals, IDEs, etc.
- Workspace names update dynamically as windows open/close

### i3grid - Window Grid Management
- Provides grid-based window positioning and resizing
- Allows precise window placement in grid layouts
- Complements i3's tiling with manual positioning control

### Status Bar Scripts
The `scripts/` directory contains various system monitoring utilities:
- **caffeine**: Prevents system sleep/suspend with toggle functionality
- **bandwidth**: Shows network upload/download speeds
- **cpu_usage**: Displays CPU utilization percentage
- **disk**: Shows disk usage and available space
- **memory**: Displays RAM usage and availability
- **temperature**: Shows CPU temperature monitoring
- **get-icon.py**: FontAwesome icon generator for consistent iconography

## Core Concepts

### What is i3?

i3 is a tiling window manager that automatically arranges windows in a non-overlapping layout. Unlike traditional
desktop environments, i3 is designed for keyboard-driven efficiency and minimal resource usage.

### Key Terms

| Term           | Description                                                                |
|----------------|----------------------------------------------------------------------------|
| **Workspace**  | Virtual desktop where windows are displayed (numbered 1-30 in this config) |
| **Container**  | A window or group of windows                                               |
| **Tiling**     | Windows arranged automatically without overlapping                         |
| **Floating**   | Windows that can overlap and be moved freely                               |
| **Mod Key**    | Primary modifier key for shortcuts (Super/Windows key in this config)      |
| **Focus**      | The currently active window                                                |
| **Scratchpad** | Hidden workspace for temporary windows                                     |

## Visual Configuration

### Appearance Settings

| Setting        | Value                                | Purpose                                |
|----------------|--------------------------------------|----------------------------------------|
| Font           | Noto Sans Regular 10, FontAwesome 10 | System font for bars and titles        |
| Window Border  | 1 pixel                              | Minimal border for clean appearance    |
| Inner Gaps     | 6 pixels                             | Space between windows                  |
| Outer Gaps     | 3 pixels                             | Space between windows and screen edges |
| Default Layout | Default                              | Standard tiling behavior               |

### Color Scheme

| Element              | Border               | Background          | Text  | Purpose                   |
|----------------------|----------------------|---------------------|-------|---------------------------|
| **Focused Window**   | Light Blue (#5294e2) | Dark Blue (#08052b) | White | Active window highlight   |
| **Unfocused Window** | Dark Blue            | Dark Blue           | Grey  | Inactive windows          |
| **Urgent Window**    | Red (#e53935)        | Red                 | White | Windows needing attention |
| **Bar Background**   | -                    | Dark Grey (#383c4a) | White | Status bar appearance     |

## Keybinding Reference

### Essential Controls

| Keybinding         | Action                      | Why It's Important               |
|--------------------|-----------------------------|----------------------------------|
| `$mod + Return`    | Open terminal               | Primary way to launch programs   |
| `$mod + q`         | Kill focused window         | Close applications               |
| `$mod + d`         | Application launcher (Rofi) | Quick program access             |
| `$mod + Shift + e` | Power menu                  | System control (logout/shutdown) |
| `$mod + Shift + c` | Reload config               | Apply configuration changes      |
| `$mod + Shift + r` | Restart i3                  | Fix issues without logging out   |

### Workspace Navigation

| Keybinding                | Action                    | Usage Tip                  |
|---------------------------|---------------------------|----------------------------|
| `$mod + 1-9, 0`           | Switch to workspace 1-10  | Primary workspaces         |
| `$mod + Control + 1-9, 0` | Switch to workspace 11-20 | Extended workspaces        |
| `$mod + Tab`              | Next workspace            | Quick cycling              |
| `$mod + Shift + Tab`      | Previous workspace        | Reverse cycling            |
| `$mod + w`                | Workspace switcher (Rofi) | Visual workspace selection |

### Window Movement

| Keybinding                        | Action                             | Usage Context                      |
|-----------------------------------|------------------------------------|------------------------------------|
| `$mod + Shift + 1-9, 0`           | Move to workspace 1-10             | Organize windows by project        |
| `$mod + Control + Shift + 1-9, 0` | Move to workspace 11-20            | Extended organization              |
| `$mod + m`                        | Enter move mode (workspaces 21-30) | Access to high-numbered workspaces |

### Window Focus & Movement

| Keybinding               | Action      | Alternative                |
|--------------------------|-------------|----------------------------|
| `$mod + j`               | Focus left  | `$mod + Left`              |
| `$mod + k`               | Focus down  | `$mod + Down`              |
| `$mod + b`               | Focus up    | `$mod + Up`                |
| `$mod + o`               | Focus right | `$mod + Right`             |
| `$mod + Shift + j/k/b/o` | Move window | Also works with arrow keys |

### Layout Management

| Keybinding     | Action                   | When to Use                    |
|----------------|--------------------------|--------------------------------|
| `$mod + h`     | Split horizontal         | Create side-by-side layout     |
| `$mod + v`     | Split vertical           | Stack windows vertically       |
| `$mod + f`     | Toggle fullscreen        | Focus on single application    |
| `$mod + s`     | Stacking layout          | Window tabs stacked vertically |
| `$mod + y`     | Tabbed layout            | Window tabs horizontally       |
| `$mod + e`     | Toggle split             | Switch between layouts         |
| `$mod + equal` | Toggle split orientation | Quick layout adjustment        |

### Floating Windows

| Keybinding             | Action               | Purpose                             |
|------------------------|----------------------|-------------------------------------|
| `$mod + Shift + Space` | Toggle floating      | Make window float/tile              |
| `$mod + Space`         | Toggle focus mode    | Switch focus between tiled/floating |
| `$mod + Mouse`         | Drag floating window | Position floating windows           |

### Scratchpad (Hidden Workspace)

| Keybinding             | Action             | Use Case                |
|------------------------|--------------------|-------------------------|
| `$mod + Shift + minus` | Move to scratchpad | Hide window temporarily |
| `$mod + minus`         | Show scratchpad    | Retrieve hidden window  |

### Media & System Controls

| Keybinding                 | Action              | Hardware Support |
|----------------------------|---------------------|------------------|
| `XF86AudioRaiseVolume`     | Volume up           | Media keys       |
| `XF86AudioLowerVolume`     | Volume down         | Media keys       |
| `XF86AudioMute`            | Toggle mute         | Media keys       |
| `XF86AudioPlay`            | Play/Pause          | Media control    |
| `XF86AudioNext/Prev`       | Next/Previous track | Media control    |
| `XF86MonBrightnessUp/Down` | Adjust brightness   | Laptop displays  |
| `$mod + p`                 | Switch audio device | Multiple outputs |

### Screenshots

| Keybinding            | Action                 | Output               |
|-----------------------|------------------------|----------------------|
| `Print`               | Full screen            | Saved to disk        |
| `Shift + Print`       | Select area            | Saved to disk        |
| `$mod + Print`        | Active window          | Saved to disk        |
| `Ctrl + Print`        | Selection to clipboard | Clipboard only       |
| `Ctrl + Middle Click` | Window to clipboard    | Quick window capture |

### Application Shortcuts

| Keybinding         | Action          | Application      |
|--------------------|-----------------|------------------|
| `$mod + n`         | File manager    | Thunar           |
| `$mod + Shift + f` | Web browser     | Firefox          |
| `$mod + t`         | Window switcher | Rofi window mode |
| `$mod + l`         | Lock screen     | Betterlockscreen |
| `$mod + F12`       | Toggle caffeine | Prevent sleep    |

## Workspace Groups & Organization

### i3-workspace-groups

| Keybinding           | Action                    | Purpose                        |
|----------------------|---------------------------|--------------------------------|
| `$mod + g`           | Switch workspace group    | Organize workspaces by project |
| `$mod + Shift + g`   | Create new group          | Start new project space        |
| `$mod + Control + g` | Assign workspace to group | Add current workspace to group |
| `$mod + comma`       | Rename workspace          | Custom workspace names         |

### Why Use Workspace Groups?

Workspace groups allow you to organize related workspaces together, perfect for:

- Separating work and personal activities
- Managing multiple projects
- Context switching between different tasks

## Window Rules & Assignments

### Automatic Workspace Assignment

| Application           | Workspace | Reason            |
|-----------------------|-----------|-------------------|
| Thunar (File Manager) | 3         | Quick file access |
| Thunderbird (Email)   | 4         | Communication hub |
| Telegram              | 5         | Instant messaging |

### Floating Window Rules

| Application Type            | Behavior         | Why Float?            |
|-----------------------------|------------------|-----------------------|
| Calculators                 | Float            | Small utility windows |
| Bluetooth manager           | Float            | Temporary settings    |
| Audio control (Pavucontrol) | Float            | Quick adjustments     |
| About dialogs               | Float            | Temporary information |
| Calendar widgets            | Float + Position | Quick reference       |

## Autostart Applications

### System Components

| Component           | Purpose                             | Priority             |
|---------------------|-------------------------------------|----------------------|
| Picom               | Compositor for transparency/effects | Visual enhancement   |
| Dunst               | Notification daemon                 | System notifications |
| Polkit              | Authentication agent                | Permission requests  |
| Autotiling          | Automatic window tiling             | Smart layouts        |
| i3-workspace-groups | Workspace organization              | Project management   |
| i3wsr               | Automatic workspace naming          | Visual organization  |

### User Environment

| Component | Purpose                   | When Loaded          |
|-----------|---------------------------|----------------------|
| Dex       | XDG autostart handler     | Loads .desktop files |
| Feh       | Wallpaper setter          | After display setup  |
| XSS-Lock  | Screen locker integration | Security             |

## Status Bar Configuration

### i3bar Settings

| Feature           | Configuration | Purpose                      |
|-------------------|---------------|------------------------------|
| Position          | Bottom        | Easy visibility              |
| Height            | 25 pixels     | Comfortable size             |
| Status Command    | i3blocks      | System information           |
| Tray Padding      | 0             | Compact appearance           |
| Workspace Numbers | Stripped      | Clean workspace names        |
| Scroll Disabled   | Yes           | Prevent accidental switching |

### Bar Colors

| Element            | Color               | Visual Purpose            |
|--------------------|---------------------|---------------------------|
| Focused Workspace  | Grey on Medium Grey | Current workspace         |
| Active Workspace   | Light Blue          | Visible on other monitors |
| Inactive Workspace | Dark Grey           | Available workspaces      |
| Urgent Workspace   | Red                 | Needs attention           |
| Separator          | Purple              | Visual distinction        |

## Advanced Features

### Move Window Mode

When activated with `$mod + m`, provides quick access to workspaces 21-30:

- Press 1-9, 0 to move window to workspace 21-30
- Press Escape/Return to exit mode
- Useful for organizing overflow windows

### Dynamic Workspace Naming

- i3wsr automatically adds icons based on running applications
- Workspaces show application icons for quick identification
- Names update dynamically as applications open/close

## Best Practices

### Workspace Organization

1. **Workspaces 1-5**: Primary daily tasks
2. **Workspaces 6-10**: Secondary applications
3. **Workspaces 11-20**: Project-specific spaces
4. **Workspaces 21-30**: Temporary/overflow windows

### Window Management Tips

- Use tiling for productivity applications (editors, terminals)
- Float only utility windows (calculators, settings)
- Use scratchpad for frequently accessed temporary windows
- Group related windows in the same workspace

### Performance Optimization

- Picom provides visual effects without heavy resource usage
- Autotiling maintains optimal window arrangements
- Minimal window decorations reduce memory usage
- Rofi provides faster application launching than traditional menus

## Troubleshooting Quick Reference

| Issue                             | Solution                  | Keybinding                |
|-----------------------------------|---------------------------|---------------------------|
| Configuration changes not applied | Reload config             | `$mod + Shift + c`        |
| i3 behaving strangely             | Restart i3                | `$mod + Shift + r`        |
| Lost window                       | Use window switcher       | `$mod + t`                |
| Need keybinding reference         | Show keyhint              | `F1`                      |
| Window in wrong workspace         | Move to correct workspace | `$mod + Shift + [number]` |

## Configuration File Locations

| Component    | Path                            | Purpose                    |
|--------------|---------------------------------|----------------------------|
| Main config  | `~/.config/i3/config`           | Primary i3 configuration   |
| i3blocks     | `~/.config/i3/i3blocks.conf`    | Status bar configuration   |
| i3wsr config | `~/.config/i3wsr/config.toml`   | Workspace naming rules     |
| i3grid config| `~/.config/i3/i3gridrc`         | Grid window management     |
| Scripts      | `~/.config/i3/scripts/`         | Helper scripts             |
| Rofi theme   | `~/.config/rofi/rofidmenu.rasi` | Application launcher theme |

## Summary

This i3 configuration provides a highly efficient, keyboard-driven desktop environment optimized for productivity. The
setup emphasizes:

- **Speed**: Quick access to everything via keyboard
- **Organization**: Multiple workspace management systems
- **Flexibility**: Both tiling and floating window support
- **Customization**: Extensive keybindings and rules
- **Visual Clarity**: Clean aesthetics with helpful visual cues

The configuration is designed to minimize mouse usage while maximizing screen real estate and workflow efficiency.
