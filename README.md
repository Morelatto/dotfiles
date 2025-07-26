# Dotfiles

Personal dotfiles for EndeavourOS managed with GNU Stow.

## Usage

```bash
task install    # Build and install all configs
task uninstall  # Remove all configs  
task --list     # Show all commands
```

## Structure

- `x11/` - X11/display configuration
- `shell/` - [zsh](https://github.com/zsh-users/zsh) and [git](https://github.com/git/git)
- `wm/` - [i3](https://github.com/Airblader/i3), [polybar](https://github.com/polybar/polybar), [dunst](https://github.com/dunst-project/dunst), [picom](https://github.com/yshui/picom)
- `terminal/` - [xfce4-terminal](https://github.com/xfce/xfce4-terminal)
- `editors/` - [neovim](https://github.com/neovim/neovim)
- `apps/` - firefox, [ranger](https://github.com/ranger/ranger)
- `scripts/` - [rofi](https://github.com/DaveDavenport/rofi), [feh](https://github.com/derf/feh), [maim](https://github.com/naelstrof/maim)
- `system/` - system-wide configs
- `bootstrap/` - installation automation

## Tools

- [exa](https://github.com/ogham/exa) - file listing
- [bat](https://github.com/sharkdp/bat) - text viewer
- [fd](https://github.com/sharkdp/fd) - file search
- [ripgrep](https://github.com/BurntSushi/ripgrep) - text search
- [bottom](https://github.com/ClementTsang/bottom) - system monitor
- [httpie](https://github.com/jakubroztocil/httpie) - http client
