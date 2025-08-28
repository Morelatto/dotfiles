<div align="center">

# 🌩️ Dotfiles

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

## Installation

```bash
sudo pacman -S ansible && ansible-pull -U https://github.com/Morelatto/dotfiles.git .setup/ansible.yml -K
```

**What it does:** Installs system packages, development tools (mise), and deploys configurations (dotter) automatically.

---

# System
<details>
<summary>Core components and system architecture</summary>

## Core Infrastructure
| Component | Tool | Implementation Details |
|-----------|------|------------------------|
| OS | [EndeavourOS](https://endeavouros.com/)/Arch Linux | Rolling release, systemd-boot, pacman parallel downloads, AUR enabled |
| Tool Manager | [mise](https://mise.jdx.dev/) | 52 tools managed • Node LTS, Python 3.12, Go/Rust/Bun/Neovim latest • Auto-activation via .mise.toml |
| Config Deploy | [dotter](https://github.com/SuperCuber/dotter) | 5 packages (terminal/desktop/dev/apps) • Symlink strategy • Pre/post deploy hooks • Cache at .dotter/cache.toml |
| Automation | [Ansible](https://github.com/ansible/ansible) | ansible-pull one-liner • Installs 60+ packages • Configures Docker • Sets up mise + dotter |

## Display
| Component | Tool | Notes |
|-----------|------|-------|
| Display Server | X.Org ([X.Org](https://www.x.org/)) | Arc-Dark GTK theme, 20min screen timeout, DPMS power management |
| Window Manager | [i3-gaps](https://github.com/Airblader/i3) | Super+Enter (terminal), Super+d (rofi), Super+Tab (workspace nav) |
| Window Tools | [i3wsr](https://github.com/roosta/i3wsr), i3blocks | EndeavourOS i3blocks config with FontAwesome icons |
| Compositor | [Picom](https://github.com/yshui/picom) | fading enabled, terminal opacity rules |
| Application Launcher | [Rofi](https://github.com/DaveDavenport/rofi) | Super+d (apps), Super+t (windows), Super+g (workspace groups) |
| Notification Daemon | [Dunst](https://github.com/dunst-project/dunst) | bottom-right, 300px width, monitor 2 |
| Status Bar | [i3blocks](https://github.com/vivien/i3blocks) | EndeavourOS setup with system monitoring modules |
| Wallpaper Manager | [feh](https://github.com/derf/feh) | --bg-fill mode, integrated with betterlockscreen |
| Screen Locker | [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen) | JetBrainsMono font, blur effect, 5s timeout, custom colors |
| Calendar | [gsimplecal](https://github.com/dmedvinsky/gsimplecal) | close on unfocus, positioned at (1680,833), highlight today |

</details>

---

# Terminal
<details>
<summary>Shell environment and command-line tools</summary>

## Shell Environment
| Component | Tool | Key Features | Source |
|-----------|------|--------------|--------|
| Shell | [Zsh](https://github.com/zsh-users/zsh) | Modular config, extensive aliases, smart completion, XDG compliant | System |
| Terminal | [XFCE4 Terminal](https://github.com/xfce-mirror/xfce4-terminal) | Nerd Font support, transparency, custom colorscheme, large scrollback | System |
| Prompt | [Starship](https://github.com/starship/starship) | Git status, command duration, exit codes, language versions | mise |
| History | [Atuin](https://github.com/ellie/atuin) | Fuzzy search, workspace filtering, secrets protection, sync support | mise |
| File Browser | [Ranger](https://github.com/ranger/ranger) | Image previews, bulk operations, VCS integration, custom actions | System |
| Directory Jump | [Zoxide](https://github.com/ajeetdsouza/zoxide) | Frecency algorithm, fuzzy matching, database import, cd replacement | mise |

## CLI Tools
| Tool | Replaces | Purpose | Key Features |
|------|----------|---------|--------------|
| [eza](https://github.com/eza-community/eza) | ls | File listing | Icons, git status, tree view, sorting options |
| [bat](https://github.com/sharkdp/bat) | cat | File viewer | Syntax highlighting, git integration, line numbers |
| [fd](https://github.com/sharkdp/fd) | find | File search | Fast performance, gitignore aware, regex support |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | grep | Text search | Recursive by default, parallel search, PCRE2 |
| [fzf](https://github.com/junegunn/fzf) | - | Fuzzy finder | Interactive selection, preview window, shell integration |
| [btop](https://github.com/aristocratos/btop) | htop | System monitor | GPU monitoring, network graphs, mouse support |
| [dust](https://github.com/bootandy/dust) | du | Disk usage | Tree visualization, percentage bars, fast scanning |
| [sd](https://github.com/chmln/sd) | sed | Find & replace | Intuitive syntax, literal strings, preview mode |
| [delta](https://github.com/dandavison/delta) | diff | Git diffs | Syntax highlighting, side-by-side view, word-level diff |
| [jq](https://github.com/jqlang/jq) | - | JSON processor | Query language, streaming, transformations |
| [yq](https://github.com/mikefarah/yq) | - | YAML processor | Multiple formats, in-place editing, path expressions |
| [hyperfine](https://github.com/sharkdp/hyperfine) | time | Benchmarking | Statistical analysis, warmup runs, export formats |
| [tokei](https://github.com/XAMPPRocky/tokei) | cloc | Code statistics | Language detection, fast counting, exclude patterns |

</details>

---

# Development
<details>
<summary>Programming tools and development environment</summary>

## Core Development Tools
| Category | Tool | Notes |
|----------|------|-------|
| Version Control | [Git](https://github.com/git/git) + [Delta](https://github.com/dandavison/delta) | Dracula theme, side-by-side, line numbers |
| Text Editor | [AstroNvim](https://github.com/AstroNvim/AstroNvim) (Neovim v5+) | 47 plugins, LSP/DAP, Git integration, fuzzy finder, file explorer, terminal |
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

## Development Tools

| Tool | Purpose | Key Shortcuts/Features |
|------|---------|------------------------|
| [lazygit](https://github.com/jesseduffield/lazygit) | Git TUI | `lg` alias, cherry-pick, interactive rebase |
| [lazydocker](https://github.com/jesseduffield/lazydocker) | Docker TUI | `lzd` alias, container logs, resource graphs |
| [gh](https://github.com/cli/cli) | GitHub CLI | PR creation, issue management, workflow runs |
| [glab](https://github.com/profclems/glab) | GitLab CLI | MR management, CI/CD pipelines, project ops |
| [glow](https://github.com/charmbracelet/glow) | Markdown viewer | Render in terminal, paging, local/remote files |
| [just](https://github.com/casey/just) | Task runner | Justfile recipes, parameters, dependencies |
| [watchexec](https://github.com/watchexec/watchexec) | File watcher | Auto-restart, debouncing, ignore patterns |
| [direnv](https://github.com/direnv/direnv) | Env manager | .envrc files, automatic load/unload |
| [bottom](https://github.com/ClementTsang/bottom) | System monitor | `btm` command, process tree, disk I/O |

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

<sub>Managed with [Dotter](https://github.com/SuperCuber/dotter) • Automated with [Ansible](https://github.com/ansible/ansible) • Enhanced with [Modern Tools](https://github.com/ibraheemdev/modern-unix)</sub>

</div>
