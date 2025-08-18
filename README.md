<div align="center">

# 🌩️ Storm's Dotfiles

**Modern dotfiles for EndeavourOS/Arch Linux with automated setup**

<a href="https://archlinux.org/">
  <img src="https://img.shields.io/badge/Arch%20Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white">
</a>
<a href="https://github.com/SuperCuber/dotter">
  <img src="https://img.shields.io/badge/Managed%20with-Dotter-4B8BF5?style=for-the-badge">
</a>
<a href="https://mise.jdx.dev/">
  <img src="https://img.shields.io/badge/Tools%20via-Mise-00ADD8?style=for-the-badge">
</a>

</div>

---

## 🚀 Quick Start

```bash
# Prerequisites
yay -S mise-bin dotter-rs-bin

# Clone and setup
git clone https://github.com/USER/dotfiles ~/Public/dotfiles
cd ~/Public/dotfiles
task setup

# Restart shell
exec zsh
```

---

# System
<details>
<summary>Core components and system architecture</summary>

## Core
| Component | Tool |
|-----------|------|
| OS | EndeavourOS/Arch Linux ([EndeavourOS](https://endeavouros.com/)) |
| Tool Manager | [mise](https://mise.jdx.dev/) | Node LTS, Python 3.12, Go/Rust/Bun latest, CLI tools auto-managed |
| Configuration Manager | [dotter](https://github.com/SuperCuber/dotter) | XDG-compliant deployment, modular package system |

## Display
| Component | Tool | Notes |
|-----------|------|-------|
| Display Server | X.Org ([X.Org](https://www.x.org/)) | Arc-Dark GTK theme, 20min screen timeout, DPMS power management |
| Window Manager | [i3-gaps](https://github.com/Airblader/i3) | Super+Enter (terminal), Super+d (rofi), Super+Tab (workspace nav) |
| Window Tools | [i3wsr](https://github.com/roosta/i3wsr), i3blocks | EndeavourOS i3blocks config with FontAwesome icons |
| Compositor | [Picom](https://github.com/yshui/picom) | fading enabled, terminal opacity rules |
| Application Launcher | [Rofi](https://github.com/DaveDavenport/rofi) | Super+d (apps), Super+t (windows), Super+g (workspace groups) |
| Notification Daemon | [Dunst](https://github.com/dunst-project/dunst) | bottom-right, 300px width, monitor 2 |
| Status Bar | [Polybar](https://github.com/polybar/polybar) + i3blocks | EndeavourOS setup with system monitoring modules |
| Wallpaper Manager | [feh](https://github.com/derf/feh) | --bg-fill mode, integrated with betterlockscreen |
| Screen Locker | [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen) | JetBrainsMono font, blur effect, 5s timeout, custom colors |
| Calendar | [gsimplecal](https://github.com/dmedvinsky/gsimplecal) | close on unfocus, positioned at (1680,833), highlight today |

</details>

---

# Terminal
<details>
<summary>Shell environment and command-line tools</summary>

## Shell Environment
| Component | Tool | Notes |
|-----------|------|-------|
| Shell | [Zsh](https://github.com/zsh-users/zsh) | arrows (history search), Ctrl+Space (alias expand), Alt+E (edit) |
| Terminal Emulator | [XFCE4 Terminal](https://github.com/xfce-mirror/xfce4-terminal) | FiraCode Nerd Font 11, transparent background, custom colors |
| Prompt | [Starship](https://github.com/starship/starship) | mise-managed |
| History | [Atuin](https://github.com/ellie/atuin) | mise-managed |
| File Manager | [Ranger](https://github.com/ranger/ranger) | ueberzug image preview, show hidden files |
| Directory Navigation | [Zoxide](https://github.com/ajeetdsouza/zoxide) | mise-managed |

## Core CLI Tools
| Tool | Replaces | Purpose | Notes |
|------|----------|---------|-------|
| [eza](https://github.com/eza-community/eza) | ls | File listing | ll (long), la (all), aliases replace ls |
| [bat](https://github.com/sharkdp/bat) | cat | Text viewer | replaces cat, syntax highlighting, b/bp/bl aliases |
| [fd](https://github.com/sharkdp/fd) | find | File search | mise-managed, respects .gitignore |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | grep | Text search | mise-managed, used by fzf integration |
| [fzf](https://github.com/junegunn/fzf) | - | Fuzzy finder | mise-managed, integrated with zsh kill completion |
| [btop](https://github.com/aristocratos/btop4) | htop | System monitor | mise-managed, modern resource monitoring |
| [dust](https://github.com/bootandy/dust) | du | Disk usage | mise-managed, colorized tree view |
| [sd](https://github.com/chmln/sd) | sed | Text processing | mise-managed, intuitive regex syntax |
| [jq](https://github.com/jqlang/jq) | - | JSON processing | mise-managed, essential for CLI JSON work |
| [yq](https://github.com/mikefarah/yq) | - | YAML processing | mise-managed, jq-like syntax for YAML |
| [hyperfine](https://github.com/sharkdp/hyperfine) | time | Benchmarking | mise-managed, statistical command timing |
| [tokei](https://github.com/XAMPPRocky/tokei) | cloc | Code statistics | mise-managed, fast language-aware counting |

</details>

---

# Development
<details>
<summary>Programming tools and development environment</summary>

## Core Development Tools
| Category | Tool | Notes |
|----------|------|-------|
| Version Control | [Git](https://github.com/git/git) + [Delta](https://github.com/dandavison/delta) | Dracula theme, side-by-side, line numbers |
| Text Editors | [Neovim](https://github.com/neovim/neovim), [Vim](https://github.com/vim/vim) | relative line numbers, 4-space tabs, smart indent, case-smart search |
| Text Editor | [Sublime Text](https://www.sublimetext.com/) | Mariana theme, save on focus lost, auto-find in selection |
| IDE | [JetBrains PyCharm](https://www.jetbrains.com/pycharm/) | 4GB heap, OpenGL acceleration, custom VM options |
| AI Assistant | [Claude Code](https://claude.ai/) | custom hooks, OTLP telemetry, 15min bash timeout |
| Containers | [Docker](https://github.com/docker/docker-ce) + [Compose](https://github.com/docker/compose) | BuildKit enabled, 10GB cache, log rotation, metrics on :9323 |

## Language Runtimes (via mise)
| Language | Tool |
|----------|------|
| Node.js | [Node.js](https://github.com/nodejs/node) |
| Python | [Python](https://github.com/python/cpython) |
| Go | [Go](https://github.com/golang/go) |
| Rust | [Rust](https://github.com/rust-lang/rust) |
| JavaScript Runtime | [Bun](https://github.com/oven-sh/bun) | XDG-compliant paths, global bin in ~/.local/bin, 60s test timeout |

## CLI Development Tools
| Tool | Purpose |
|------|----------|
| [lazygit](https://github.com/jesseduffield/lazygit) | Git UI | mise-managed, terminal git interface |
| [lazydocker](https://github.com/jesseduffield/lazydocker) | Docker UI | mise-managed, terminal docker interface |
| [gh](https://github.com/cli/cli) | GitHub CLI | mise-managed, used for PR/issue management |
| [glab](https://github.com/profclems/glab) | GitLab CLI | mise-managed, GitLab workflows |
| [glow](https://github.com/charmbracelet/glow) | Markdown renderer | mise-managed, terminal markdown viewer |
| [just](https://github.com/casey/just) | Command runner | mise-managed, modern make alternative |
| [watchexec](https://github.com/watchexec/watchexec) | File watcher | mise-managed, execute on file changes |
| [direnv](https://github.com/direnv/direnv) | Environment manager | mise-managed, per-directory env vars |
| [repomix](https://github.com/yamadashy/repomix) | Documentation | 10MB max file size, excludes binary/media files |

</details>

---

# Applications
<details>
<summary>User applications and utilities</summary>

## User Applications
| Category | Tool | Notes |
|----------|------|-------|
| Web Browser | [Firefox](https://github.com/mozilla/gecko-dev) | arkenfox user.js, Tree Style Tab, uBlock Origin |
| Note Taking | [Obsidian](https://obsidian.md/) | 9 plugins: Dataview, Excalidraw, Canvas, Task Progress, Heatmap Calendar |
| Update Notifier | [Kalu](https://github.com/jjk-jacky/kalu) | 120min interval, AUR support, auto-checks enabled |
| Package Manager | pacman + [yay](https://github.com/Jguer/yay) | AUR helper for community packages |

</details>

---

<div align="center">

**Built with ❤️ using Arch Linux**

<sub>Managed with [Dotter](https://github.com/SuperCuber/dotter) • Automated with [Task](https://taskfile.dev/) • Enhanced with [Modern Tools](https://github.com/ibraheemdev/modern-unix)</sub>

</div>
