<div align="center">

#  Dotfiles

[![Linux](https://img.shields.io/badge/Linux-333333?style=flat-square&logo=linux&logoColor=white)](https://www.kernel.org/)
[![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=flat-square&logo=ansible&logoColor=white)](https://www.ansible.com)
[![License](https://img.shields.io/badge/license-MIT-333333?style=flat-square)](LICENSE)

</div>

> **Ansible** provisions packages and bootstraps • **Dotter** manages XDG-compliant configs • **Mise** handles dev toolchains

<br>

<div align="center">

## Prerequisites

<table>
  <tr>
    <th width="33%" align="center">Operating System</th>
    <th width="33%" align="center">Network</th>
    <th width="34%" align="center">Tools</th>
  </tr>
  <tr>
    <td align="center" valign="middle" height="200">
      <img width="64" height="64" alt="Linux" src="https://cdn.simpleicons.org/linux/FFFFFF">
      <br><br>
      <b>Linux</b>
      <br>
      <sub>any modern Linux distro</sub>
    </td>
    <td align="center" valign="middle" height="200">
      <img width="64" height="64" alt="Internet" src="https://cdn.simpleicons.org/curl/073551">
      <br><br>
      <b>Internet Access</b>
      <br>
      <sub>for downloading packages</sub>
    </td>
    <td align="center" valign="middle" height="200">
      <img width="64" height="64" alt="Ansible" src="https://cdn.simpleicons.org/ansible/EE0000">
      <br><br>
      <b>Ansible</b>
      <br>
      <sub>automation platform</sub>
    </td>
  </tr>
</table>

</div>

<br>
<br>

<div align="center">

## Installation

<table width="100%">
  <tr>
    <th width="50%">Desktop</th>
    <th width="50%">Minimal</th>
  </tr>
  <tr>
    <td valign="top" align="center">
      <sub>
      <code>ansible-pull <span style="color:#4285F4">-U</span> https://github.com/Morelatto/dotfiles.git dev/ansible/ansible.yml <span style="color:#4285F4">-K</span></code>
      </sub>
      <br><br>
      <sub>
      Complete shell environment with modern CLI utilities<br>
      X11 tiling window manager with compositor<br>
      Application launcher and desktop notifications<br>
      Web browser, productivity apps, and IDEs
      </sub>
      <br><br>
      <sub><i>For workstations and laptops</i></sub>
    </td>
    <td valign="top" align="center">
      <sub>
      <code>ansible-pull <span style="color:#4285F4">-U</span> https://github.com/Morelatto/dotfiles.git dev/ansible/ansible.yml <span style="color:#4285F4">-K -e</span> <span style="color:#EA4335">profile=minimal</span></code>
      </sub>
      <br><br>
      <sub>
      Shell environment with essential CLI utilities<br>
      Modern replacements for GNU coreutils<br>
      Multi-language development toolchain<br>
      Terminal-based text editor and version control
      </sub>
      <br><br>
      <sub><i>For servers, containers, headless systems</i></sub>
    </td>
  </tr>
</table>

</div>

<br>
<br>

<div align="center">

## System

</div>

<details>
<summary>Core infrastructure, automation, and display environment</summary>

### Core Infrastructure

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="Linux" src="https://cdn.simpleicons.org/linux/FFFFFF"></td>
    <td><a href="https://www.kernel.org/">Linux</a></td>
    <td>Base operating system</td>
    <td>Pacman with parallel downloads, verbose output, multilib repo, easter egg progress bar</td>
  </tr>
  <tr>
    <td><img width="28" alt="Ansible" src="https://cdn.simpleicons.org/ansible"></td>
    <td><a href="https://www.ansible.com">Ansible</a></td>
    <td>Bootstrap and package installation</td>
    <td>Profile support (minimal shell vs full desktop), installs base + AUR packages, configures services, deploys mise + dotter</td>
  </tr>
  <tr>
    <td><img width="28" alt="Dotter" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/SuperCuber/dotter">Dotter</a></td>
    <td>Symlink‑based config deployment</td>
    <td>2 packages (shell, desktop), automated hooks (SSH permissions, i3 auto-reload, picom restart, cache setup)</td>
  </tr>
  <tr>
    <td><img width="28" alt="Mise" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://mise.jdx.dev">Mise</a></td>
    <td>Polyglot tool/version manager</td>
    <td>Manages languages (Node, Python 3.12, Go, Rust, Bun), editors (Neovim), modern CLI tools, git/dev/container tools, security tools (age, sops), npm globals, pipx tools</td>
  </tr>
</table>

### Desktop Environment

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="X.Org" src="https://cdn.simpleicons.org/xdotorg/F28834"></td>
    <td><a href="https://www.x.org/">X.Org</a></td>
    <td>Display server (X11)</td>
    <td>Arc-Dark GTK theme, Qogir icons/cursor, Brazilian keyboard layout, dual monitor setup, screen timeout/DPMS power management, Firefox GTK integration</td>
  </tr>
  <tr>
    <td><img width="28" alt="i3" src="https://cdn.simpleicons.org/i3/249ED9"></td>
    <td><a href="https://i3wm.org">i3</a></td>
    <td>Tiling window manager</td>
    <td>30 workspaces with multi-key access, custom gaps and borders, purple/blue color scheme, extensive keybindings (Super+Enter/d/t/g/l/n), autostart integrations (picom, dunst, autotiling, i3wsr, workspace-groups, feh)</td>
  </tr>
  <tr>
    <td><img width="28" alt="Rofi" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://davatorium.github.io/rofi/">Rofi</a></td>
    <td>Application launcher / window switcher</td>
    <td>Arc dark transparent theme, grid layout, Qogir icons, keybindings for apps/windows/workspace-groups</td>
  </tr>
  <tr>
    <td><img width="28" alt="Picom" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/yshui/picom">picom</a></td>
    <td>Compositor</td>
    <td>Fading transitions, terminal opacity rules, blur effects (dual_kawase), GLX backend with vsync</td>
  </tr>
  <tr>
    <td><img width="28" alt="Dunst" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/dunst-project/dunst">dunst</a></td>
    <td>Notification daemon</td>
    <td>Bottom-right placement, purple theme, rounded corners, Qogir icons, timeout settings, multi-monitor support</td>
  </tr>
  <tr>
    <td><img width="28" alt="i3blocks" src="https://cdn.simpleicons.org/i3/249ED9"></td>
    <td><a href="https://github.com/vivien/i3blocks">i3blocks</a></td>
    <td>Status bar</td>
    <td>Custom modules (launchers, system monitoring, status indicators, actions), FontAwesome icons, varied update intervals</td>
  </tr>
  <tr>
    <td><img width="28" alt="i3wsr" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/roosta/i3wsr">i3wsr</a></td>
    <td>Workspace renaming</td>
    <td>FontAwesome icon mapping for 36 window classes, icons-only mode, duplicate removal</td>
  </tr>
  <tr>
    <td><img width="28" alt="Feh" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/derf/feh">feh</a></td>
    <td>Wallpaper manager</td>
    <td>Background fill mode, betterlockscreen integration, i3 autostart</td>
  </tr>
  <tr>
    <td><img width="28" alt="betterlockscreen" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/betterlockscreen/betterlockscreen">betterlockscreen</a></td>
    <td>Screen locker</td>
    <td>Blur effect, custom colors (transparent login box, red error highlights), Nerd Font, wallpaper integration, xss-lock trigger</td>
  </tr>
  <tr>
    <td><img width="28" alt="gsimplecal" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/dmedvinsky/gsimplecal">gsimplecal</a></td>
    <td>Calendar widget</td>
    <td>Close on unfocus, minimal decoration, event highlighting</td>
  </tr>
</table>

</details>

<br>
<br>

<div align="center">

## Terminal

</div>

<details>
<summary>Shell environment and command-line tools</summary>

### Shell Environment

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="Zsh" src="https://cdn.simpleicons.org/zsh"></td>
    <td><a href="https://github.com/zsh-users/zsh">Zsh</a></td>
    <td>Primary shell</td>
    <td>Modular conf.d/ with decade-based numbering, XDG compliant, smart completion caching, syntax highlighting, autosuggestions, emacs keybindings, fuzzy matching</td>
  </tr>
  <tr>
    <td><img width="28" alt="XFCE" src="https://cdn.simpleicons.org/xfce/2284F2"></td>
    <td><a href="https://github.com/xfce-mirror/xfce4-terminal">XFCE4 Terminal</a></td>
    <td>Terminal emulator</td>
    <td>Custom purple theme, FiraCode Nerd Font, transparency, unlimited scrollback, minimal UI (no scrollbar/bell)</td>
  </tr>
  <tr>
    <td><img width="28" alt="starship" src="https://cdn.simpleicons.org/starship/DD0B78"></td>
    <td><a href="https://starship.rs"><code>starship</code></a></td>
    <td>Shell prompt</td>
    <td>Conditional loading with fallback to minimal zsh prompt</td>
  </tr>
  <tr>
    <td><img width="28" alt="atuin" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/atuinsh/atuin"><code>atuin</code></a></td>
    <td>Shell history management</td>
    <td>Fuzzy search, workspace filtering, regex secret filtering, command stats tracking, multi-filter priority system</td>
  </tr>
  <tr>
    <td><img width="28" alt="Ranger" src="https://cdn.simpleicons.org/python/3776AB"></td>
    <td><a href="https://github.com/ranger/ranger"><code>ranger</code></a></td>
    <td>File browser</td>
    <td>Minimal customization: image previews, hidden files, borders</td>
  </tr>
  <tr>
    <td><img width="28" alt="zoxide" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/ajeetdsouza/zoxide"><code>zoxide</code></a></td>
    <td>Smart directory jumping</td>
    <td>Shell integration, j/zd/zf aliases (fzf-enhanced fuzzy selection)</td>
  </tr>
</table>

### Modern CLI Replacements

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="eza" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/eza-community/eza"><code>eza</code></a></td>
    <td>Modern file listing (replaces <code>ls</code>)</td>
    <td>14 aliases (long/all/recursive/dotfiles/sorting/tree/git-status)</td>
  </tr>
  <tr>
    <td><img width="28" alt="bat" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/sharkdp/bat"><code>bat</code></a></td>
    <td>File viewer (replaces <code>cat</code>)</td>
    <td>Overrides cat/less, FZF preview integration, aliases for plain/line-range modes</td>
  </tr>
  <tr>
    <td><img width="28" alt="fd" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/sharkdp/fd"><code>fd</code></a></td>
    <td>Fast file search (replaces <code>find</code>)</td>
    <td>13 aliases (depth limits, type filters, hidden files, case-insensitive, size/exec operations)</td>
  </tr>
  <tr>
    <td><img width="28" alt="ripgrep" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/BurntSushi/ripgrep"><code>ripgrep</code></a></td>
    <td>Text search (replaces <code>grep</code>)</td>
    <td>Overrides grep, 11 aliases (context/files/word/count/type filters), custom search function with color and line numbers</td>
  </tr>
  <tr>
    <td><img width="28" alt="fzf" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/junegunn/fzf"><code>fzf</code></a></td>
    <td>Fuzzy finder</td>
    <td>Custom UI options, Ctrl+T for files, bat preview integration, enhanced process killing with smart name extraction</td>
  </tr>
  <tr>
    <td><img width="28" alt="btop" src="https://cdn.simpleicons.org/cplusplus/00599C"></td>
    <td><a href="https://github.com/aristocratos/btop"><code>btop</code></a></td>
    <td>System monitor (replaces <code>htop</code>)</td>
    <td>Overrides top/htop commands</td>
  </tr>
  <tr>
    <td><img width="28" alt="dust" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/bootandy/dust"><code>dust</code></a></td>
    <td>Disk usage (replaces <code>du</code>)</td>
    <td>Overrides du, depth limit aliases</td>
  </tr>
  <tr>
    <td><img width="28" alt="sd" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/chmln/sd"><code>sd</code></a></td>
    <td>Find & replace (replaces <code>sed</code>)</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="delta" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/dandavison/delta"><code>delta</code></a></td>
    <td>Git diff viewer</td>
    <td>GIT_PAGER integration, Dracula theme, side-by-side diffs with decorations, histogram algorithm</td>
  </tr>
  <tr>
    <td><img width="28" alt="jq" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/jqlang/jq"><code>jq</code></a></td>
    <td>JSON processor</td>
    <td>Used in i3blocks weather script</td>
  </tr>
  <tr>
    <td><img width="28" alt="yq" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/mikefarah/yq"><code>yq</code></a></td>
    <td>YAML processor</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="hyperfine" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/sharkdp/hyperfine"><code>hyperfine</code></a></td>
    <td>Benchmarking (replaces <code>time</code>)</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="tokei" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/XAMPPRocky/tokei"><code>tokei</code></a></td>
    <td>Code statistics (replaces <code>cloc</code>)</td>
    <td>—</td>
  </tr>
</table>

</details>

<br>
<br>

<div align="center">

## Development

</div>

<details>
<summary>Programming tools and development environment</summary>

### Language Runtimes

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="Node.js" src="https://cdn.simpleicons.org/nodedotjs/339933"></td>
    <td><a href="https://github.com/nodejs/node">Node.js</a></td>
    <td>JavaScript runtime</td>
    <td>Latest channel via mise</td>
  </tr>
  <tr>
    <td><img width="28" alt="Python" src="https://cdn.simpleicons.org/python/3776AB"></td>
    <td><a href="https://github.com/python/cpython">Python</a></td>
    <td>Python runtime</td>
    <td>3.12 via mise, pipx backend for global tools, XDG paths, pyenv build optimizations, pip/uv configs</td>
  </tr>
  <tr>
    <td><img width="28" alt="Go" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/golang/go">Go</a></td>
    <td>Go runtime</td>
    <td>Latest via mise, custom GOPATH (/opt/go), CGO enabled, module mode, proxy configured</td>
  </tr>
  <tr>
    <td><img width="28" alt="Rust" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/rust-lang/rust">Rust</a></td>
    <td>Rust toolchain</td>
    <td>Stable channel via mise, cargo bin in ~/.local, parallel builds, tmp build dir, clang+lld linker</td>
  </tr>
  <tr>
    <td><img width="28" alt="Bun" src="https://cdn.simpleicons.org/bun/000000"></td>
    <td><a href="https://github.com/oven-sh/bun">Bun</a></td>
    <td>JavaScript runtime / bundler</td>
    <td>Latest via mise, XDG-compliant paths, test timeout configured</td>
  </tr>
</table>

### Editors & IDEs

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="Neovim" src="https://cdn.simpleicons.org/neovim/57A143"></td>
    <td><a href="https://github.com/AstroNvim/AstroNvim">AstroNvim</a></td>
    <td>Terminal text editor</td>
    <td>AstroNvim v5 base config (customizations disabled)</td>
  </tr>
  <tr>
    <td><img width="28" alt="Sublime Text" src="https://cdn.simpleicons.org/sublimetext/FF9800"></td>
    <td><a href="https://www.sublimetext.com/">Sublime Text</a></td>
    <td>GUI text editor</td>
    <td>Mariana color scheme, save on focus lost, multiple packages (GitGutter, BracketHighlighter, SideBarEnhancements, etc.)</td>
  </tr>
  <tr>
    <td><img width="28" alt="PyCharm" src="https://cdn.simpleicons.org/pycharm/000000"></td>
    <td><a href="https://www.jetbrains.com/pycharm/">PyCharm</a></td>
    <td>Python IDE</td>
    <td>Performance tuning (increased heap, indexing threads, zero-latency typing), RAM disk cache paths</td>
  </tr>
</table>

### Version Control

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="Git" src="https://cdn.simpleicons.org/git/F05032"></td>
    <td><a href="https://github.com/git/git">Git</a></td>
    <td>Version control system</td>
    <td>Delta integration (Dracula theme, side-by-side diffs, decorations), extensive aliases (32 conventional commands), smart URL cleanup, custom functions (gitquick, gitroot), auto-setup remote, rebase on pull</td>
  </tr>
  <tr>
    <td><img width="28" alt="lazygit" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/jesseduffield/lazygit"><code>lazygit</code></a></td>
    <td>Git TUI</td>
    <td>lg alias</td>
  </tr>
  <tr>
    <td><img width="28" alt="GitHub" src="https://cdn.simpleicons.org/github/181717"></td>
    <td><a href="https://github.com/cli/cli"><code>gh</code></a></td>
    <td>GitHub CLI</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="GitLab" src="https://cdn.simpleicons.org/gitlab/FC6D26"></td>
    <td><a href="https://github.com/profclems/glab"><code>glab</code></a></td>
    <td>GitLab CLI</td>
    <td>—</td>
  </tr>
</table>

### Containers & Orchestration

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="Docker" src="https://cdn.simpleicons.org/docker/2496ED"></td>
    <td><a href="https://github.com/docker/docker-ce">Docker</a></td>
    <td>Container runtime</td>
    <td>BuildKit enabled, log rotation, garbage collection, metrics endpoint, resource ulimits, systemd cgroup driver</td>
  </tr>
  <tr>
    <td><img width="28" alt="Docker Compose" src="https://cdn.simpleicons.org/docker/2496ED"></td>
    <td><a href="https://github.com/docker/compose">Docker Compose</a></td>
    <td>Multi-container orchestration</td>
    <td>CLI build integration</td>
  </tr>
  <tr>
    <td><img width="28" alt="lazydocker" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/jesseduffield/lazydocker"><code>lazydocker</code></a></td>
    <td>Docker TUI</td>
    <td>lzd alias</td>
  </tr>
  <tr>
    <td><img width="28" alt="Kubernetes" src="https://cdn.simpleicons.org/kubernetes/326CE5"></td>
    <td><a href="https://kubernetes.io/"><code>kubectl</code></a></td>
    <td>Kubernetes CLI</td>
    <td>XDG config path</td>
  </tr>
  <tr>
    <td><img width="28" alt="k9s" src="https://cdn.simpleicons.org/kubernetes/326CE5"></td>
    <td><a href="https://k9scli.io/"><code>k9s</code></a></td>
    <td>Kubernetes TUI</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="Helm" src="https://cdn.simpleicons.org/helm/0F1689"></td>
    <td><a href="https://helm.sh/"><code>helm</code></a></td>
    <td>Kubernetes package manager</td>
    <td>—</td>
  </tr>
</table>

### Development Utilities

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="Claude" src="https://cdn.simpleicons.org/anthropic/181818"></td>
    <td><a href="https://claude.ai/">Claude Code</a></td>
    <td>AI coding assistant</td>
    <td>Telemetry disabled, OTEL metrics to localhost, extended bash timeout, superpowers plugin, always-thinking mode</td>
  </tr>
  <tr>
    <td><img width="28" alt="Glow" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/charmbracelet/glow"><code>glow</code></a></td>
    <td>Markdown viewer</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="Just" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/casey/just"><code>just</code></a></td>
    <td>Task runner</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="watchexec" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/watchexec/watchexec"><code>watchexec</code></a></td>
    <td>File watcher</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="direnv" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/direnv/direnv"><code>direnv</code></a></td>
    <td>Environment manager</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="bottom" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/ClementTsang/bottom"><code>bottom</code></a></td>
    <td>System monitor</td>
    <td>btm alias</td>
  </tr>
  <tr>
    <td><img width="28" alt="age" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/FiloSottile/age"><code>age</code></a></td>
    <td>File encryption</td>
    <td>—</td>
  </tr>
  <tr>
    <td><img width="28" alt="sops" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/mozilla/sops"><code>sops</code></a></td>
    <td>Secrets management</td>
    <td>—</td>
  </tr>
</table>

</details>

<br>
<br>

<div align="center">

## Applications

</div>

<details>
<summary>User applications and utilities</summary>

### User Applications

<table>
  <tr>
    <th width="48">Icon</th>
    <th width="160">Tool</th>
    <th width="200">Purpose</th>
    <th>Details</th>
  </tr>
  <tr>
    <td><img width="28" alt="Firefox" src="https://cdn.simpleicons.org/firefoxbrowser/FF7139"></td>
    <td><a href="https://github.com/mozilla/gecko-dev">Firefox</a></td>
    <td>Web browser</td>
    <td>Arkenfox user.js overrides (session restore, privacy settings, keyboard shortcuts), addon configs (Tree Style Tab userChrome, uBlock Origin, Cookie AutoDelete)</td>
  </tr>
  <tr>
    <td><img width="28" alt="Obsidian" src="https://cdn.simpleicons.org/obsidian/7C3AED"></td>
    <td><a href="https://obsidian.md/">Obsidian</a></td>
    <td>Note taking & knowledge management</td>
    <td>App settings (link updates, spellcheck, delete prompts), community plugins (editor-width-slider, table-editor, dataview, canvas, task-progress, heatmap, excalidraw, vextab)</td>
  </tr>
  <tr>
    <td><img width="28" alt="Kalu" src="https://cdn.simpleicons.org/linux/FCC624"></td>
    <td><a href="https://github.com/jjk-jacky/kalu">Kalu</a></td>
    <td>Update notifier</td>
    <td>2hr check interval, auto-checks (upgrades, watched, AUR), click actions (notifications, check, toggle), built-in upgrade interface</td>
  </tr>
  <tr>
    <td><img width="28" alt="yay" src="https://cdn.simpleicons.org/linux/FCC624"></td>
    <td><a href="https://github.com/Jguer/yay">yay</a></td>
    <td>Package helper</td>
    <td>Extensive aliases (install, search, update, no-confirm variants, full system update, cache cleanup)</td>
  </tr>
</table>

</details>

<br>
<br>

<div align="center">

## Design Principles

</div>

<table width="100%">
<tr>
<td align="center" valign="top" width="16.66%">
<br>
<strong>XDG‑first</strong>
<br><br>
<sub>Config in <code>~/.config</code>, caches in <code>~/.cache</code>, data in <code>~/.local/share</code></sub>
<br><br>
</td>
<td align="center" valign="top" width="16.66%">
<br>
<strong>Idempotent</strong>
<br><br>
<sub>Safe to re‑run on existing machines</sub>
<br><br>
</td>
<td align="center" valign="top" width="16.66%">
<br>
<strong>Versioned</strong>
<br><br>
<sub>Profiles in VCS, select at deploy time</sub>
<br><br>
</td>
<td align="center" valign="top" width="16.66%">
<br>
<strong>Secure</strong>
<br><br>
<sub>No secrets in git, use local overlays</sub>
<br><br>
</td>
<td align="center" valign="top" width="16.66%">
<br>
<strong>Modular</strong>
<br><br>
<sub>Ansible roles, Dotter packages, Zsh conf.d</sub>
<br><br>
</td>
<td align="center" valign="top" width="16.66%">
<br>
<strong>Declarative</strong>
<br><br>
<sub>"What" before "how", document why</sub>
<br><br>
</td>
</tr>
</table>

</div>

<br>

<div align="center">

<br>

**Built on Linux**<br>
Powered by <a href="https://www.ansible.com">Ansible</a>, <a href="https://github.com/SuperCuber/dotter">Dotter</a>, and <a href="https://mise.jdx.dev">Mise</a> • MIT License

</div>

<!-- Reference Links -->
[1]: https://mise.jdx.dev
[2]: https://github.com/SuperCuber/dotter
[3]: https://github.com/i3/i3
[4]: https://github.com/davatorium/rofi
[5]: https://observablehq.com/@gampleman/simple-icons-slug-checker
[6]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
