# Dotfiles

My personal dotfiles managed with GNU Stow.

## Structure

Each directory is a "stow package" that can be installed independently:

- `x11/` - X11 configuration (Xresources, xinitrc, display scripts)
- `shell/` - Shell configuration (zsh, git)
- `wm/` - Window manager configs (i3, polybar, picom, dunst)
- `terminal/` - Terminal emulators (alacritty, urxvt)
- `editors/` - Text editors (vim, sublime)
- `apps/` - Application configs (firefox, ranger)
- `scripts/` - User scripts in ~/.local/bin
- `system/` - System configs that need root (etc files)
- `bootstrap/` - System installation and package setup scripts

## Installation

### Quick Start

1. **New system setup:**

   **EndeavourOS Automated (Recommended):**
   ```bash
   # Boot EndeavourOS live ISO, then copy files:
   cp bootstrap/endeavouros-automation/user_commands.bash /home/liveuser/
   cp bootstrap/endeavouros-automation/user_pkglist.txt /home/liveuser/
   chmod +x /home/liveuser/user_commands.bash
   # Run Calamares installer - automation happens automatically
   ```

   **Manual installation:**
   ```bash
   # Install packages
   sudo pacman -S --needed - < bootstrap/packages/base.txt
   sudo pacman -S --needed - < bootstrap/packages/display.txt
   yay -S --needed - < bootstrap/packages/aur.txt
   
   # Manual steps
   chsh -s $(which zsh)
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   getnf -i Noto
   sudo systemctl enable betterlockscreen@$USER
   ```

2. **Install dotfiles with Stow:**

   All user configs:
   ```bash
   stow -v -t ~ x11 shell wm terminal editors apps scripts
   ```

   Specific package only:
   ```bash
   stow -v -t ~ x11  # Just X11 configs
   ```

   System configs (need root):
   ```bash
   sudo stow -v -t / system
   ```

### Managing Configs

Uninstall package:
```bash
stow -v -D -t ~ x11
```

Reinstall package (useful after changes):
```bash
stow -v -R -t ~ x11
```

## EndeavourOS Tools

Useful EndeavourOS-specific commands:
```bash
# System management
eos-welcome              # Main configuration hub
eos-update-notifier     # Update checking
eos-rankmirrors         # Update mirrors
eos-pacdiff             # Handle .pacnew files

# Package management  
eos-packagelist --list  # List available profiles
yay -S package-name     # Install AUR packages

# System info
eos-log-tool            # System logs
eos-apps-info           # Browse EndeavourOS tools
```

## Notes

- Always use `-v` for verbose output with stow
- Use `-n` for dry run to see what would happen
- Use `-D` to delete/unstow
- Use `-R` to restow (uninstall then reinstall)
- EndeavourOS automation clones dotfiles automatically
- Update git URL in `bootstrap/endeavouros-automation/user_commands.bash`

---

# System

## Core
- Kernel: [Linux](https://github.com/torvalds/linux)

## Display
- Display Server: X.Org
- Window Manager: [i3](https://github.com/Airblader/i3) 
- Application Launcher: [rofi](https://github.com/DaveDavenport/rofi)
- Notification Daemon: [dunst](https://github.com/dunst-project/dunst)
- Status Bar & Tray: [polybar](https://github.com/polybar/polybar)
- Icon Theme: [Paper Icon Theme](https://github.com/snwh/paper-icon-theme)
- Cursor Theme: [Vimix-cursors](https://github.com/vinceliuice/Vimix-cursors)
- Font: [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

## Terminal
- Shell: [zsh](https://github.com/zsh-users/zsh)
- Terminal Emulator: [Alacritty](https://github.com/alacritty/alacritty)
- Version Control System: [Git](https://github.com/git/git)
- Text Editor: [Vim](https://github.com/vim/vim)
- File Management: [exa](https://github.com/ogham/exa)
- Text Viewer: [bat](https://github.com/sharkdp/bat)
- Documentation: [cheat](https://github.com/cheat/cheat)
- File Search: [fd](https://github.com/sharkdp/fd)
- Image Viewer: [feh](https://github.com/derf/feh)
- Network Tool: [httpie](https://github.com/jakubroztocil/httpie)
- Text Search: [ripgrep](https://github.com/BurntSushi/ripgrep)
- Screenshot Tool: [maim](https://github.com/naelstrof/maim)
- System Monitoring: [bottom](https://github.com/ClementTsang/bottom)

## User Applications
- Web Browser: Firefox
- Office Suite: LibreOffice
- Media Player: VLC
- Development Tools: IntelliJ, VSCodium
