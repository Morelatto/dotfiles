<div align="center">

# 🚀 Storm's Dotfiles

<p align="center">
  <img src="https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white" alt="Arch Linux">
  <img src="https://img.shields.io/badge/Shell-Zsh-green?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Zsh">
  <img src="https://img.shields.io/badge/Managed_with-Dotter-blue?style=for-the-badge" alt="Dotter">
  <img src="https://img.shields.io/badge/Automated_with-Task-red?style=for-the-badge" alt="Task">
</p>

<p align="center">
  <b>Modern, modular dotfiles for Arch Linux with smart deployment and modern CLI tools</b>
</p>

<p align="center">
  <a href="#-quick-start">Quick Start</a> •
  <a href="#-features">Features</a> •
  <a href="#-dependencies">Dependencies</a> •
  <a href="#-installation">Installation</a> •
  <a href="#-usage">Usage</a> •
  <a href="#-customization">Customization</a>
</p>

</div>

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🎯 Core Features
- **Modular Configuration** - Organized by application
- **Safe Deployment** - Backup and rollback capabilities  
- **Performance Optimized** - Lazy loading & caching
- **Git-Crypt Security** - Encrypted sensitive files

</td>
<td width="50%">

### 🛠️ Modern Tools
- **Better CLI** - bat, eza, ripgrep, fd, dust
- **Smart Navigation** - autojump, fzf integration
- **Beautiful Prompt** - Starship cross-shell prompt
- **History Search** - Atuin for better shell history

</td>
</tr>
</table>

## 📦 Quick Start

<details>
<summary><b>📋 Prerequisites</b></summary>

```bash
# Core deployment tools
sudo pacman -S git go-task
cargo install dotter

# Essential shell packages  
sudo pacman -S zsh starship fzf zsh-syntax-highlighting zsh-autosuggestions
```

</details>

<details open>
<summary><b>🚀 Installation</b></summary>

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles ~/Public/dotfiles
cd ~/Public/dotfiles

# Initial setup (creates local config)
task setup

# Deploy dotfiles
task deploy
```

</details>

## 🛠️ Dependencies

<details>
<summary><b>📌 Core Requirements</b></summary>

<table>
<thead>
<tr>
<th width="20%">Category</th>
<th width="20%">Tool</th>
<th width="40%">Purpose</th>
<th width="20%">Install</th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="3"><b>🐚 Shell</b></td>
<td><code>zsh</code></td>
<td>Z shell (required)</td>
<td><code>pacman -S zsh</code></td>
</tr>
<tr>
<td><code>starship</code></td>
<td>Cross-shell prompt</td>
<td><code>pacman -S starship</code></td>
</tr>
<tr>
<td><code>atuin</code></td>
<td>Shell history sync</td>
<td><code>pacman -S atuin</code></td>
</tr>
<tr>
<td rowspan="2"><b>🔧 Deploy</b></td>
<td><code>dotter</code></td>
<td>Symlink manager</td>
<td><code>cargo install dotter</code></td>
</tr>
<tr>
<td><code>task</code></td>
<td>Task automation</td>
<td><code>pacman -S go-task</code></td>
</tr>
</tbody>
</table>

</details>

<details>
<summary><b>⚡ Modern CLI Replacements</b></summary>

<table>
<thead>
<tr>
<th>Traditional</th>
<th>Modern</th>
<th>Features</th>
<th>Install</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>cat</code></td>
<td><b><code>bat</code></b></td>
<td>
  <img src="https://img.shields.io/badge/-Syntax_Highlighting-green?style=flat-square">
  <img src="https://img.shields.io/badge/-Git_Integration-blue?style=flat-square">
</td>
<td><code>pacman -S bat</code></td>
</tr>
<tr>
<td><code>ls</code></td>
<td><b><code>eza</code></b></td>
<td>
  <img src="https://img.shields.io/badge/-Icons-yellow?style=flat-square">
  <img src="https://img.shields.io/badge/-Tree_View-green?style=flat-square">
  <img src="https://img.shields.io/badge/-Git_Status-blue?style=flat-square">
</td>
<td><code>pacman -S eza</code></td>
</tr>
<tr>
<td><code>find</code></td>
<td><b><code>fd</code></b></td>
<td>
  <img src="https://img.shields.io/badge/-Intuitive-purple?style=flat-square">
  <img src="https://img.shields.io/badge/-Fast-red?style=flat-square">
</td>
<td><code>pacman -S fd</code></td>
</tr>
<tr>
<td><code>grep</code></td>
<td><b><code>ripgrep</code></b></td>
<td>
  <img src="https://img.shields.io/badge/-Blazing_Fast-red?style=flat-square">
  <img src="https://img.shields.io/badge/-Respects_.gitignore-gray?style=flat-square">
</td>
<td><code>pacman -S ripgrep</code></td>
</tr>
<tr>
<td><code>du</code></td>
<td><b><code>dust</code></b></td>
<td>
  <img src="https://img.shields.io/badge/-Visual_Tree-green?style=flat-square">
  <img src="https://img.shields.io/badge/-Sorted-blue?style=flat-square">
</td>
<td><code>pacman -S dust</code></td>
</tr>
<tr>
<td><code>cd</code></td>
<td><b><code>autojump</code></b></td>
<td>
  <img src="https://img.shields.io/badge/-Smart_Nav-purple?style=flat-square">
  <img src="https://img.shields.io/badge/-Learns-orange?style=flat-square">
</td>
<td><code>pacman -S autojump</code></td>
</tr>
<tr>
<td><code>top</code></td>
<td><b><code>btop</code></b></td>
<td>
  <img src="https://img.shields.io/badge/-Beautiful_UI-pink?style=flat-square">
  <img src="https://img.shields.io/badge/-Mouse_Support-cyan?style=flat-square">
</td>
<td><code>pacman -S btop</code></td>
</tr>
</tbody>
</table>

</details>

<details>
<summary><b>💻 Development Tools</b></summary>

<table>
<thead>
<tr>
<th width="20%">Tool</th>
<th width="30%">Purpose</th>
<th width="25%">Required For</th>
<th width="25%">Install</th>
</tr>
</thead>
<tbody>
<tr>
<td><b><code>git</code></b></td>
<td>Version control</td>
<td><img src="https://img.shields.io/badge/-Essential-red?style=flat-square"></td>
<td><code>pacman -S git</code></td>
</tr>
<tr>
<td><b><code>neovim</code></b></td>
<td>Text editor</td>
<td><img src="https://img.shields.io/badge/-Code_Editing-green?style=flat-square"></td>
<td><code>pacman -S neovim</code></td>
</tr>
<tr>
<td><b><code>docker</code></b></td>
<td>Containerization</td>
<td><img src="https://img.shields.io/badge/-Containers-blue?style=flat-square"></td>
<td><code>pacman -S docker</code></td>
</tr>
<tr>
<td><b><code>kubectl</code></b></td>
<td>Kubernetes CLI</td>
<td><img src="https://img.shields.io/badge/-K8s-purple?style=flat-square"></td>
<td><code>pacman -S kubectl</code></td>
</tr>
<tr>
<td><b><code>fnm</code></b></td>
<td>Node Manager</td>
<td><img src="https://img.shields.io/badge/-Node.js-green?style=flat-square"></td>
<td><code>cargo install fnm</code></td>
</tr>
<tr>
<td><b><code>git-delta</code></b></td>
<td>Better diffs</td>
<td><img src="https://img.shields.io/badge/-Git_Enhancement-orange?style=flat-square"></td>
<td><code>pacman -S git-delta</code></td>
</tr>
</tbody>
</table>

</details>

<details>
<summary><b>🖥️ Desktop Environment</b></summary>

<table>
<thead>
<tr>
<th>Component</th>
<th>Tool</th>
<th>Purpose</th>
<th>Install</th>
</tr>
</thead>
<tbody>
<tr>
<td><b>Window Manager</b></td>
<td><code>i3-gaps</code></td>
<td>Tiling WM</td>
<td><code>pacman -S i3-gaps</code></td>
</tr>
<tr>
<td><b>Compositor</b></td>
<td><code>picom</code></td>
<td>Transparency</td>
<td><code>pacman -S picom</code></td>
</tr>
<tr>
<td><b>Notifications</b></td>
<td><code>dunst</code></td>
<td>Notification daemon</td>
<td><code>pacman -S dunst</code></td>
</tr>
<tr>
<td><b>Launcher</b></td>
<td><code>rofi</code></td>
<td>App launcher</td>
<td><code>pacman -S rofi</code></td>
</tr>
<tr>
<td><b>Status Bar</b></td>
<td><code>i3blocks</code></td>
<td>System status</td>
<td><code>pacman -S i3blocks</code></td>
</tr>
</tbody>
</table>

</details>

## 📁 Repository Structure

<details>
<summary><b>📂 Directory Layout</b></summary>

```
dotfiles/
├── 📋 .dotter/
│   ├── global.toml      # Package definitions & symlink mappings
│   ├── local.toml       # Local config (gitignored)
│   └── pre/post_*.sh    # Deployment hooks
│
├── 🔧 config/
│   ├── zsh/             # → ~/.config/zsh/
│   │   ├── .zshrc       # Main config loader
│   │   ├── .zshenv      # Environment variables
│   │   ├── conf.d/      # Modular config files
│   │   ├── plugins/     # Plugin configurations
│   │   └── functions/   # Custom shell functions
│   │
│   ├── git/             # Git configuration
│   ├── vim/             # Vim/Neovim configs
│   ├── i3/              # i3 window manager
│   └── system/          # System configs (/etc/)
│
├── 📜 scripts/          # → ~/.local/bin/
└── 🤖 Taskfile.yml      # Automation tasks
```

</details>

## 🎯 Task Commands

<details>
<summary><b>📝 Essential Tasks</b></summary>

<table>
<thead>
<tr>
<th width="30%">Command</th>
<th width="40%">Description</th>
<th width="30%">Safety Features</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>task deploy</code></td>
<td>Deploy dotfiles</td>
<td>
  <img src="https://img.shields.io/badge/-Backs_up_files-green?style=flat-square">
  <img src="https://img.shields.io/badge/-Checks_conflicts-blue?style=flat-square">
</td>
</tr>
<tr>
<td><code>task update</code></td>
<td>Pull & redeploy</td>
<td>
  <img src="https://img.shields.io/badge/-Fetches_latest-purple?style=flat-square">
</td>
</tr>
<tr>
<td><code>task backup:create</code></td>
<td>Create backup</td>
<td>
  <img src="https://img.shields.io/badge/-Timestamped-orange?style=flat-square">
</td>
</tr>
<tr>
<td><code>task backup:restore</code></td>
<td>Restore backup</td>
<td>
  <img src="https://img.shields.io/badge/-Interactive-cyan?style=flat-square">
</td>
</tr>
<tr>
<td><code>task status</code></td>
<td>Show status</td>
<td>
  <img src="https://img.shields.io/badge/-Lists_symlinks-gray?style=flat-square">
</td>
</tr>
</tbody>
</table>

</details>

<details>
<summary><b>⚙️ Advanced Tasks</b></summary>

<table>
<thead>
<tr>
<th>Command</th>
<th>Description</th>
<th>Use Case</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>task deploy:force</code></td>
<td>Force deployment</td>
<td>Overwrites without prompts</td>
</tr>
<tr>
<td><code>task deploy:packages</code></td>
<td>Deploy specific</td>
<td><code>PACKAGES=shell,git task deploy:packages</code></td>
</tr>
<tr>
<td><code>task system:install</code></td>
<td>System configs</td>
<td>Requires sudo, modifies <code>/etc/</code></td>
</tr>
<tr>
<td><code>task docker:test</code></td>
<td>Test in Docker</td>
<td>Safe testing environment</td>
</tr>
<tr>
<td><code>task clean</code></td>
<td>Clean symlinks</td>
<td>Remove broken links</td>
</tr>
</tbody>
</table>

</details>

## 🔧 Configuration Packages

<details>
<summary><b>📦 Available Packages</b></summary>

<table>
<thead>
<tr>
<th>Package</th>
<th>Contents</th>
<th>Dependencies</th>
</tr>
</thead>
<tbody>
<tr>
<td><b>shell</b></td>
<td>zsh, atuin</td>
<td>zsh, starship (optional)</td>
</tr>
<tr>
<td><b>development</b></td>
<td>git, vim, npm, docker</td>
<td>git, neovim/vim</td>
</tr>
<tr>
<td><b>desktop</b></td>
<td>i3, picom, dunst, rofi</td>
<td>X11/Wayland</td>
</tr>
<tr>
<td><b>terminal</b></td>
<td>xfce4-terminal</td>
<td>Desktop environment</td>
</tr>
<tr>
<td><b>system</b></td>
<td>ranger, autostart</td>
<td>Various</td>
</tr>
<tr>
<td><b>gui</b></td>
<td>GTK, Firefox, Obsidian</td>
<td>Desktop environment</td>
</tr>
<tr>
<td><b>scripts</b></td>
<td>Custom scripts</td>
<td>None</td>
</tr>
</tbody>
</table>

</details>

## 🚀 Installation

<details>
<summary><b>📥 Full Installation (Arch Linux)</b></summary>

```bash
# Core + Modern CLI tools
sudo pacman -S --needed \
    zsh starship atuin \
    bat eza fd ripgrep dust tree autojump \
    git neovim git-delta \
    btop \
    fzf zsh-syntax-highlighting zsh-autosuggestions \
    xsel scrot \
    networkmanager ufw tcpdump wireguard-tools

# Development tools (optional)
sudo pacman -S --needed \
    docker docker-compose kubectl \
    go-task npm

# AUR packages (optional)
paru -S --needed \
    potato fnm

# Cargo packages (optional)
cargo install dotter fnm
```

</details>

<details>
<summary><b>📦 Minimal Installation</b></summary>

```bash
# Absolute minimum for basic functionality
sudo pacman -S --needed \
    zsh git fzf \
    zsh-syntax-highlighting zsh-autosuggestions
```

</details>

<details>
<summary><b>✅ Dependency Check</b></summary>

```bash
#!/bin/bash
# Check installed dependencies
echo "Checking dependencies..."
echo ""

check_cmd() {
    if command -v $1 >/dev/null 2>&1; then
        echo "✅ $1"
    else
        echo "❌ $1"
    fi
}

echo "Core Tools:"
for cmd in zsh starship atuin dotter task; do
    check_cmd $cmd
done

echo ""
echo "CLI Tools:"
for cmd in bat eza fd rg dust tree autojump; do
    check_cmd $cmd
done

echo ""
echo "Development:"
for cmd in git nvim docker kubectl fnm delta; do
    check_cmd $cmd
done

echo ""
echo "System:"
for cmd in btop fzf xsel; do
    check_cmd $cmd
done
```

</details>

## 🔐 Security & Privacy

<details>
<summary><b>🔒 Configuration Security</b></summary>

<table>
<tr>
<td width="50%">

### Git Configuration
- **Public**: Aliases, tools, merge strategies
- **Private**: User, email, tokens (`~/.config/git/config.local`)
- Never commits personal information

</td>
<td width="50%">

### Sensitive Files
- SSH keys encrypted with git-crypt
- Personal configs excluded from VCS
- API tokens stored separately

</td>
</tr>
</table>

</details>

## 🐛 Troubleshooting

<details>
<summary><b>❓ Common Issues</b></summary>

<table>
<thead>
<tr>
<th>Issue</th>
<th>Solution</th>
</tr>
</thead>
<tbody>
<tr>
<td><b>Zsh not loading configs</b></td>
<td>Ensure <code>.zshrc</code> exists in source, run <code>task deploy</code></td>
</tr>
<tr>
<td><b>Autojump not working</b></td>
<td>Install with <code>pacman -S autojump</code>, restart shell</td>
</tr>
<tr>
<td><b>Symlinks broken</b></td>
<td>Run <code>task clean</code> then <code>task deploy</code></td>
</tr>
<tr>
<td><b>Permission denied</b></td>
<td>Check file ownership, run <code>task fix:permissions</code></td>
</tr>
</tbody>
</table>

</details>

<details>
<summary><b>🔍 Debug Commands</b></summary>

```bash
# Check ZDOTDIR
echo $ZDOTDIR

# Test zsh config loading
zsh -xic 'true' 2>&1 | grep -E "(source|ZDOTDIR)"

# Verify dotter status
dotter --dry-run deploy

# Check specific alias/function
zsh -i -c 'type <command>'

# List all symlinks
find ~ -type l -ls 2>/dev/null | grep dotfiles

# Check git config order
git config --list --show-origin
```

</details>

## 📝 Customization

<details>
<summary><b>➕ Adding New Configurations</b></summary>

1. **Create directory** under `config/`
2. **Add symlink mapping** to `.dotter/global.toml`
3. **Assign to package** group
4. **Test deployment** with `dotter deploy --dry-run`
5. **Deploy** with `task deploy`

### Example: Adding tmux config

```toml
# .dotter/global.toml
[development.files]
"config/tmux/tmux.conf" = "~/.tmux.conf"
```

</details>

<details>
<summary><b>🏠 Local Overrides</b></summary>

- **Zsh**: Create `~/.config/zsh/.zshrc.local`
- **Git**: Use `~/.config/git/config.local`
- **Dotter**: Add to `.dotter/local.toml`

</details>

## 🤝 Contributing

<details>
<summary><b>💡 Ideas for Contributions</b></summary>

- Add support for more shells (bash, fish)
- Include additional window managers
- Expand development tool configurations
- Add more modern CLI tool replacements
- Create installation scripts for other distros
- Add theme switching capabilities

</details>

---

<div align="center">

## 📄 License

MIT - Feel free to use and modify as needed

<br>

<p align="center">
  <a href="Taskfile.yml"><b>📋 Task Commands</b></a> •
  <a href=".dotter/global.toml"><b>📦 Packages</b></a> •
  <a href="../../wiki"><b>📚 Wiki</b></a> •
  <a href="../../issues"><b>🐛 Issues</b></a>
</p>

<br>

<sub>Made with ❤️ and lots of ☕</sub>

</div>