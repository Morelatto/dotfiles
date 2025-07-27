# ⚙️ Dotfiles

> *Elegant, minimal dotfiles managed with [yadm](https://yadm.io/) for a streamlined Linux development environment*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell: Zsh](https://img.shields.io/badge/Shell-Zsh-green.svg)](https://www.zsh.org/)
[![WM: i3](https://img.shields.io/badge/WM-i3-orange.svg)](https://i3wm.org/)

---

## ✨ Features

- 🚀 **Blazing Fast Zsh** — Minimal configuration without frameworks
- 🎨 **Adaptive Theming** — Machine-specific configs using yadm templates
- 🪟 **i3wm Workspace** — Polybar, dunst, picom, and custom scripts
- 🛠️ **Development Ready** — Neovim, Git, terminal emulators pre-configured
- 📦 **Smart Package Management** — Distro-aware aliases and bootstrap scripts

## 🚀 Quick Start

```bash
# Install yadm
sudo pacman -S yadm              # Arch Linux
sudo apt install yadm            # Ubuntu/Debian

# Clone and bootstrap
yadm clone https://github.com/yourusername/dotfiles.git
yadm bootstrap
```

That's it! Your environment is ready. 🎉

## 📂 Structure

```
📁 dotfiles/
├── 📁 .config/
│   ├── 🎨 alacritty/           # Terminal emulator
│   ├── 🔔 dunst/               # Notifications  
│   ├── 📝 git/                 # Version control
│   ├── 🪟 i3/                  # Window manager
│   ├── ⚡ nvim/                # Modern editor
│   ├── 📊 polybar/             # Status bar
│   ├── 🧭 ranger/              # File manager
│   ├── 🖥️ X11/                 # Display server
│   ├── 🏗️ yadm/                # Bootstrap & hooks
│   └── 🐚 zsh/                 # Shell configuration
├── 📁 .local/bin/              # Custom scripts
├── 📁 etc/                     # System configs (yadm managed)
├── 🔧 .zshenv                  # Shell environment
├── 🔑 .gitconfig               # Git configuration
└── 🎨 .Xresources              # X11 resources
```

## 🎯 Highlights

### **Zsh Configuration**
- ⚡ **Lightning startup** — No Oh My Zsh overhead
- 🏷️ **200+ smart aliases** — Organized by category and distro
- 🎨 **Clean prompt** — Git status, directory info
- ⌨️ **Vim keybindings** — Efficient navigation

### **yadm Templates**
Smart configurations that adapt to your environment:

| Template | Purpose |
|----------|---------|
| `##template` | Dynamic configs with variables |
| `##class.Work` | Work-specific settings |
| `##distro.Arch` | Arch Linux optimizations |
| `##hostname.storm-desktop` | Desktop-specific configs |

### **Automation**
- 🏗️ **Bootstrap scripts** — Automated package installation
- 🔄 **Post-alt hooks** — Reload configs after template processing
- 🔐 **Encryption ready** — Sensitive files protection

## 🛠️ Usage

```bash
# Available tasks (requires task)
task install       # Full yadm installation
task update        # Pull latest changes  
task templates     # Process templates only
task bootstrap     # Run bootstrap scripts
task status        # Check repo status
```

## 🎨 Customization

**Add aliases**
```bash
echo "alias myalias='command'" >> ~/.config/zsh/config/aliases/custom.zsh
```

**Create machine-specific config**
```bash
# Automatically loads only on storm-laptop
touch ~/.config/app/config##hostname.storm-laptop
```

**Add bootstrap packages**
```bash
echo "package-name" >> ~/.config/yadm/bootstrap.d/packages##class.Arch
```

## 🧰 Included Tools

| Tool | Purpose | Why included |
|------|---------|-------------|
| [eza](https://github.com/eza-community/eza) | File listing | Modern `ls` replacement |
| [bat](https://github.com/sharkdp/bat) | File viewing | Syntax highlighting |
| [fd](https://github.com/sharkdp/fd) | File search | Faster `find` |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Text search | Lightning-fast `grep` |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder | Interactive selection |
| [bottom](https://github.com/ClementTsang/bottom) | System monitor | Beautiful `htop` alternative |

---

<div align="center">

**Made with ❤️ for productive development**

[Report Bug](https://github.com/yourusername/dotfiles/issues) • [Request Feature](https://github.com/yourusername/dotfiles/issues)

</div>