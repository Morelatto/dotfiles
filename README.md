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
| **terminal** | Shell environment | Zsh configuration, Starship prompt, Atuin history, custom scripts |
| **development** | Programming tools | Git with delta, Docker, Neovim, language-specific configurations |
| **desktop** | Window management | i3-gaps, Picom compositor, Rofi launcher, Dunst notifications |
| **applications** | Application configs | Firefox user.js, Obsidian settings, GTK themes |

### Modern CLI Tools

This configuration replaces traditional Unix utilities with modern alternatives:

| Traditional | Replacement | Improvement |
|-------------|-------------|-------------|
| `cat` | `bat` | Syntax highlighting, line numbers, Git integration |
| `ls` | `eza` | File icons, tree view, Git status indicators |
| `find` | `fd` | 5x faster, intuitive syntax, respects .gitignore |
| `grep` | `ripgrep` | 10x faster, recursive by default, smart case |
| `du` | `dust` | Interactive tree view, percentage breakdowns |
| `cd` | `autojump` | Frecency-based directory navigation |
| `top` | `btop` | Modern UI, mouse support, detailed metrics |
| `man` | `tldr` | Simplified, practical examples |
| `diff` | `delta` | Side-by-side view, syntax highlighting |

### Development Environment

- **Version Control**: Git with delta, GPG signing, git-crypt
- **Containers**: Docker with BuildKit, Compose, experimental features
- **Languages**: Python (uv), Node.js (fnm/bun), Rust (cargo), Go
- **Editors**: Neovim (primary), Vim, Sublime Text
- **AI Tools**: Claude Code, LLM CLI, Aider
- **Documentation**: Marp, Mermaid, Repomix

</details>

---

## Configuration
<details>
<summary>Customization and structure</summary>

### Zsh Features

The shell configuration includes powerful features:

- **Smart completion** with fuzzy matching and context awareness
- **Git integration** with branch info, status indicators, and shortcuts
- **Directory navigation** with autojump, z-style jumping, and history
- **Modern aliases** replacing traditional tools (ls→eza, cat→bat, etc.)
- **AI integration** with Claude Code, LLM CLI, and development helpers
- **Performance optimized** with lazy loading and caching

### AI Development Tools

Ready-to-use AI coding assistants:

```bash
# Claude Code integration
cl "help me debug this function"           # Basic usage
clhere                                     # Analyze current directory
clfile script.py "explain this code"      # File analysis

# LLM CLI integration  
llm4 "write a bash function"              # GPT-4o
llmcode "optimize this algorithm"         # Code-focused
llmcommit                                 # Generate commit messages

# Development workflows
repodoc                                   # Generate repo documentation
repoai                                    # AI-optimized repo analysis
```

### Local Overrides

Machine-specific configurations that are not tracked:

- `~/.config/zsh/.zshrc.local` - Personal shell configuration
- `~/.config/git/config.local` - Personal Git settings (name, email, tokens)
- `.dotter/local.toml` - Machine-specific package selection
- `~/.config/*/local/*` - Any local configs per application

### Package Selection

Edit `.dotter/local.toml` to select which packages to deploy:

```toml
packages = ["terminal", "development"]
```

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
| `task backup` | Create timestamped backup |
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