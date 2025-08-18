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

**Prerequisites**: EndeavourOS (or Arch) with `mise` and `dotter` installed:
```bash
yay -S mise-bin dotter-rs-bin
```

### Complete Setup
```bash
git clone https://github.com/USER/dotfiles ~/Public/dotfiles
cd ~/Public/dotfiles

# One command setup
task setup
```

### Manual Setup (2 commands)
```bash
# 1. Install development tools (node, go, rust, bat, fzf, etc.)
mise install  

# 2. Deploy configuration files  
dotter deploy
```

**Then restart your shell:** `exec zsh`

---

## 🏗️ Architecture

**Simple 2-layer architecture** (system packages handled by EndeavourOS):

| Layer | Tool | Purpose | Examples |
|-------|------|---------|----------|
| **Development** | `mise` | Language runtimes & CLI tools | Node.js, Go, Rust, bat, eza, fzf, starship |
| **Configuration** | `dotter` | Deploy config files | ZSH, Git, i3, Neovim configs |

### Why This Works?
- ✅ **EndeavourOS provides the base** - desktop, fonts, essential tools
- ✅ **Mise manages dev tools** - languages and modern CLI utilities  
- ✅ **Dotter handles configs** - all your personal configuration files
- ✅ **No conflicts** - each tool has a clear purpose

---

## Features
<details>
<summary>What's included</summary>

### Package System

| Package | Purpose | Primary Components |
|---------|---------|-------------------|
| **terminal** | Shell environment | Zsh (conf.d + plugins), Starship prompt, Atuin history sync, custom scripts |
| **development** | Programming tools | Git with delta, Docker, Neovim, Claude Code, language configs |
| **desktop** | Window management | i3-gaps with i3blocks/i3wsr/i3grid, Picom, Rofi, Dunst, Polybar |
| **applications** | Application configs | Firefox user.js, Obsidian settings, GTK themes, PyCharm |
| **system-reference** | System configs | Lightdm, Pacman, X11 configs (manual install required) |

### Modern CLI Tools

This configuration replaces traditional Unix utilities with modern alternatives:

| Traditional | Replacement | Improvement |
|-------------|-------------|-------------|
| `cat` | `bat` | Syntax highlighting, line numbers, Git integration |
| `ls` | `eza` | File icons, tree view, Git status indicators |
| `find` | `fd` | 5x faster, intuitive syntax, respects .gitignore |
| `grep` | `ripgrep` | 10x faster, recursive by default, smart case |
| `du` | `dust` | Interactive tree view, percentage breakdowns |
| `cd` | `zoxide` | Frecency-based directory navigation (via mise) |
| `top` | `btop` | Modern UI, mouse support, detailed metrics |
| `man` | `tldr` | Simplified, practical examples |
| `diff` | `delta` | Side-by-side view, syntax highlighting |

### Development Environment

- **Tool Management**: Mise for version management, system packages via packages.toml
- **Version Control**: Git with delta, GPG signing, git-crypt  
- **Containers**: Docker with BuildKit, Compose, experimental features
- **Languages**: Python (uv), Node.js (bun), Rust (cargo), Go (all via mise)
- **Editors**: Neovim (primary), Vim, Sublime Text, PyCharm CE
- **AI Tools**: Claude Code, LLM CLI, Repomix for documentation
- **Window Management**: i3-gaps with i3wsr (workspace naming), i3grid (positioning), i3blocks (status)

</details>

---

## Configuration
<details>
<summary>Customization and structure</summary>

### Zsh Features

The shell configuration includes powerful features:

- **Modular structure** with conf.d/ configs and plugins/ organization
- **Smart completion** with fuzzy matching and fzf kill process completion
- **Git integration** with branch info, status indicators, and shortcuts
- **Directory navigation** with zoxide, z-style jumping, and atuin history search
- **Modern aliases** replacing traditional tools (ls→eza, cat→bat, etc.)
- **AI integration** with Claude Code, LLM CLI, and development helpers
- **Performance optimized** with lazy loading and caching

### Desktop Environment

The i3 window manager setup includes advanced workspace and window management:

- **i3-gaps** - Tiling window manager with gaps between windows
- **i3wsr** - Automatic workspace naming with FontAwesome icons based on running applications
- **i3grid** - Grid-based window positioning and management for precise layout control  
- **i3blocks** - Modular status bar with system monitoring (CPU, memory, temperature, bandwidth)
- **Polybar** - Alternative status bar (configured but not active by default)
- **Rofi** - Application launcher, window switcher, and workspace selector

### AI Development Tools

Ready-to-use AI coding assistants:

```bash
# Claude Code integration
claude "help me debug this function"      # Basic usage  
cc "analyze current directory"            # Shorthand
ccr                                       # Resume session

# LLM CLI integration  
llm4 "write a bash function"              # GPT-4o
llmcommit                                 # Generate commit messages

# Development workflows
repoai                                    # AI-optimized repo analysis
repomix                                   # Repository documentation
```

### Tool Management

Modern development tools are managed through **mise** (version manager):

#### **Language Runtimes (5 tools)**
- **Node.js** 22.18.0 LTS - JavaScript runtime with npm 10.9.3
- **Python** 3.12.11 - Python interpreter with pip support
- **Go** 1.25.0 - Go programming language with workspace at `/opt/go`
- **Rust** stable - Rust toolchain with cargo package manager
- **Bun** 1.2.20 - Fast JavaScript runtime and package manager

#### **Essential CLI Tools (15 tools)**
- **bat** 0.25.0 - Syntax highlighting cat replacement
- **eza** 0.23.0 - Modern ls with icons and git integration
- **fd** 10.2.0 - Fast find replacement
- **ripgrep** 14.1.1 - Fast grep replacement (rg command)
- **fzf** 0.65.1 - Fuzzy finder for interactive selections
- **starship** 1.23.0 - Cross-shell prompt with git integration
- **delta** 0.18.2 - Git diff viewer with syntax highlighting
- **dust** 1.2.3 - Interactive du replacement
- **btop** 1.4.4 - Resource monitor (htop/top replacement)
- **zoxide** 0.9.8 - Smart cd command with frecency algorithm
- **atuin** 18.8.0 - Shell history sync with fuzzy search
- **yq** 4.47.1 - YAML processor
- **jq** 1.8.1 - JSON processor
- **sd** 1.0.0 - Intuitive sed replacement
- **hyperfine** 1.19.0 - Command-line benchmarking tool
- **tokei** 12.1.2 - Code statistics and line counter

#### **Development Tools (10 tools)**
- **gh** 2.76.2 - GitHub CLI for repository management
- **glab** 1.67.0 - GitLab CLI for project management
- **lazygit** 0.54.2 - Terminal UI for git operations
- **lazydocker** 0.24.1 - Terminal UI for docker management
- **glow** 2.1.1 - Markdown renderer for terminal
- **direnv** 2.37.1 - Directory-specific environment variables
- **docker-compose** 2.39.2 - Multi-container Docker applications
- **just** 1.42.4 - Command runner (Makefile alternative)
- **watchexec** 2.3.2 - File watcher for running commands
- **bottom** 0.11.1 - System monitor alternative

#### **Container & Kubernetes Tools (3 tools)**
- **kubectl** 1.33.4 - Kubernetes command-line tool
- **k9s** 0.50.9 - Terminal UI for Kubernetes clusters
- **helm** 3.18.5 - Kubernetes package manager

#### **Security Tools (2 tools)**
- **age** 1.2.1 - File encryption tool
- **sops** 3.10.2 - Secrets management

#### **Additional Tools (installed separately)**
- **tldr** 3.4.1 - Simplified man pages (via pip)
- **httpie** 3.2.4 - User-friendly HTTP client (via pip)

#### **Management Commands**
```bash
mise install          # Install all tools from mise.toml
mise upgrade           # Update all tools to latest versions
mise list             # Show all installed tools and versions
mise which <tool>     # Show path to specific tool
mise doctor           # Check system configuration
```

#### **System Packages**
Non-mise tools documented in `packages.toml` for Arch/AUR installations.

### Local Overrides

Machine-specific configurations that are not tracked:

- `~/.config/zsh/.zshrc.local` - Personal shell configuration
- `~/.config/git/config.local` - Personal Git settings (name, email, tokens)
- `.dotter/local.toml` - Machine-specific package selection
- `~/.config/*/local/*` - Any local configs per application

### Package Selection

Edit `.dotter/local.toml` to select which packages to deploy:

```toml
packages = ["terminal", "desktop", "development", "applications"]
```

Available packages: `terminal`, `desktop`, `development`, `applications`, `system-reference`

</details>

---

## Commands
<details>
<summary>Task automation reference</summary>

### Deployment

| Command | Description |
|---------|-------------|
| `task deploy` | Deploy all packages with automatic backups |
| `task deploy:force` | Force deployment, overwriting existing files |
| `task deploy:dry-run` | Preview changes without applying |
| `task undeploy` | Remove all managed symlinks |
| `task update` | Pull latest changes and redeploy |

### Maintenance

| Command | Description |
|---------|-------------|
| `task tools:install` | Install global development tools |
| `task tools:update` | Update all global tools |
| `mise install` | Install tools defined in mise.toml |
| `mise upgrade` | Update all mise-managed tools |
| `task backup:create` | Create timestamped backup |
| `task backup:restore` | Restore from latest backup |
| `task status` | Show current deployment status |
| `task clean` | Remove broken symlinks and temp files |

### System

| Command | Description |
|---------|-------------|
| `task system:install` | Install system configs (requires sudo) |
| `task packages:install` | Install required system packages |
| `task watch` | Monitor for configuration changes |

</details>

---

## Technical Details
<details>
<summary>Architecture and implementation</summary>

### How It Works

1. **Dotter** manages symlinks from repository to system locations
2. **Task** provides consistent command interface and automation
3. **Package system** allows granular deployment control
4. Follows XDG Base Directory specification

### Deployment Model

- **User configurations** deployed to `~/.config/` and `~/.local/`
- **System configurations** in `system/` require manual deployment to `/etc/`
- All deployments create backups before overwriting
- Symlinks allow instant updates when repository changes

### Performance Optimizations

#### Zsh Startup
- Completion caching with weekly refresh
- Lazy loading for heavy plugins
- Conditional PATH modifications
- Compiled zcompdump for faster loading

#### Tool Loading
- Commands checked before aliasing
- Functions loaded on-demand
- Heavy operations backgrounded
- Minimal synchronous operations

### Security Features

- **SSH**: Ed25519 keys, strict host checking, no agent forwarding
- **Git**: GPG signing ready, separate local config, git-crypt support
- **System**: X11 hardening, firewall configs, restricted permissions
- **Best Practice**: `.local` pattern for untracked personal data

</details>

---

<div align="center">

**Built with ❤️ using Arch Linux**

<sub>Managed with [Dotter](https://github.com/SuperCuber/dotter) • Automated with [Task](https://taskfile.dev/) • Enhanced with [Modern Tools](https://github.com/ibraheemdev/modern-unix)</sub>

</div>