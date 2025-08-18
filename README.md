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
# One-liner installation
curl -sL https://raw.githubusercontent.com/USER/dotfiles/main/bootstrap.sh | bash

# Or clone and run
git clone https://github.com/USER/dotfiles ~/Public/dotfiles
cd ~/Public/dotfiles
./bootstrap.sh
```

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

- **Language Runtimes**: Node.js, Python, Go, Rust, Bun (automatically installed)
- **CLI Tools**: bat, eza, fd, ripgrep, fzf, starship, delta, dust, btop, etc.
- **Development Tools**: lazygit, lazydocker, gh, glow, httpie, and more
- **System Packages**: Documented in `packages.toml` for Arch/AUR installations

Use `mise install` to install all tools or `mise upgrade` to update them.

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