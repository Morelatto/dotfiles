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
    <td>Pacman: ParallelDownloads=5, ILoveCandy progress bar, VerbosePkgLists, Color, DownloadUser=alpm, multilib repo enabled</td>
  </tr>
  <tr>
    <td><img width="28" alt="Ansible" src="https://cdn.simpleicons.org/ansible"></td>
    <td><a href="https://www.ansible.com">Ansible</a></td>
    <td>Bootstrap and package installation</td>
    <td>Profile support (shell-only vs full desktop). Installs 9 base packages + 3 AUR (mise, dotter, betterlockscreen). Full profile adds 40+ desktop packages + 5 AUR apps. Configures Docker, enables services, runs mise install, deploys dotter configs.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Dotter" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/SuperCuber/dotter">Dotter</a></td>
    <td>Symlink‑based config deployment</td>
    <td>73 file mappings across 2 packages (shell, desktop). Pre-deploy creates directories. Post-deploy fixes SSH permissions (700/600), auto-reloads i3 if modified within 10s, restarts picom, creates vim/nvim cache dirs.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Mise" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://mise.jdx.dev">Mise</a></td>
    <td>Polyglot tool/version manager</td>
    <td>72 tools across 6 categories: 5 languages (node/python 3.12/go/rust stable/bun), 1 editor (neovim), 15 modern CLI tools, 6 git tools, 7 dev tools, 6 container tools, 2 security tools, 11 npm globals, 4 pipx tools. Sets EDITOR=nvim, GOPATH=/opt/go.</td>
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
    <td>Arc-Dark GTK theme, Qogir-dark icons/cursor (size 16/24), Brazilian keyboard (br pc104), flat mouse acceleration, dual monitor 3840x1080 (DP-2 primary + HDMI-0), 20min screen lock timeout, 30min DPMS standby/suspend/off, Firefox GTK integration</td>
  </tr>
  <tr>
    <td><img width="28" alt="i3" src="https://cdn.simpleicons.org/i3/249ED9"></td>
    <td><a href="https://i3wm.org">i3</a></td>
    <td>Tiling window manager</td>
    <td>30 workspaces total (1-10 number keys, 11-20 Ctrl+number, 21-30 move mode). Gaps: inner 6px, outer 3px, 1px borders. Purple/blue colors (#5294e2, #08052b, #e345ff). Keys: Super+Enter (terminal), Super+d (rofi apps), Super+t (windows), Super+g (workspace groups), Super+Tab (next/prev workspace), Super+l (lock), Super+n (Thunar), Super+Shift+f (Firefox). Autostart: picom, dunst, autotiling, i3wsr, i3-workspace-groups, feh wallpaper.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Rofi" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://davatorium.github.io/rofi/">Rofi</a></td>
    <td>Application launcher / window switcher</td>
    <td>arc_dark_transparent_colors theme, Noto Sans 10, Qogir icons, 3 columns × 10 lines, 30px padding. Keybindings: Super+d (app launcher), Super+t (window switcher), Super+g (workspace group switcher)</td>
  </tr>
  <tr>
    <td><img width="28" alt="Picom" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/yshui/picom">picom</a></td>
    <td>Compositor</td>
    <td>Shadows disabled. Fading enabled (fade-in 0.03, fade-out 0.03). Opacity: Alacritty 95%/90%, xfce4-terminal 95%/92% (focused/unfocused). Blur: dual_kawase strength 3, excludes dock/desktop. GLX backend with vsync.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Dunst" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/dunst-project/dunst">dunst</a></td>
    <td>Notification daemon</td>
    <td>Bottom-right origin, offset (30, 40), 300px width, dynamic 0-300px height, monitor 2. Purple theme (#28143c bg, #7f3fbf frame, #ff7f7f critical), 7px corner radius, transparency 16. Noto Sans 9, Qogir icons (max 32px). Timeout: 5s normal/low, 120s critical. Max 5 notifications.</td>
  </tr>
  <tr>
    <td><img width="28" alt="i3blocks" src="https://cdn.simpleicons.org/i3/249ED9"></td>
    <td><a href="https://github.com/vivien/i3blocks">i3blocks</a></td>
    <td>Status bar</td>
    <td>Modules: launchers (terminal, browser, files, caffeine, bluetooth), system (disk /, CPU usage, CPU temp, memory, network, weather), status (volume, power profile menu/status, time/calendar), actions (keybindings help, shutdown menu). Update intervals: CPU/memory 2s, disk 30s, weather 30min, volume 1s. FontAwesome icons, Noto Sans 10.</td>
  </tr>
  <tr>
    <td><img width="28" alt="i3wsr" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/roosta/i3wsr">i3wsr</a></td>
    <td>Workspace renaming</td>
    <td>Manual TOML mapping of 36 window classes to FontAwesome icons (firefox, terminals, editors, thunar, discord, spotify, vlc, gimp, obsidian, docker, virt-viewer, pavucontrol, libreoffice suite). Default icon:  (fa-window-maximize). Options: remove_duplicates=true, no_names=true (icons only).</td>
  </tr>
  <tr>
    <td><img width="28" alt="Feh" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/derf/feh">feh</a></td>
    <td>Wallpaper manager</td>
    <td>--bg-fill mode, wallpaper: ~/.config/wallpapers/default.png. Integrated with betterlockscreen for wallpaper setting. Launched via i3 autostart with 1s delay.</td>
  </tr>
  <tr>
    <td><img width="28" alt="betterlockscreen" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/betterlockscreen/betterlockscreen">betterlockscreen</a></td>
    <td>Screen locker</td>
    <td>JetBrainsMono Nerd Font, blur effect (level 1), dim 40, 5s timeout. Colors: transparent black login box (#00000066), white ring, red wrong password (#d23c3dff inside, white ring), red key highlight, black background. Text: "Enter password to unlock". Wallpaper via feh --bg-fill. Triggered by Super+l and xss-lock.</td>
  </tr>
  <tr>
    <td><img width="28" alt="gsimplecal" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/dmedvinsky/gsimplecal">gsimplecal</a></td>
    <td>Calendar widget</td>
    <td>Close on unfocus, Sans 11 font, highlight today and event days, no week numbers, no decoration, not sticky (doesn't appear on all workspaces). Dynamic positioning (mainwindow_position=none).</td>
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
    <td>Modular conf.d/ structure: 25 numbered files (00-80 control load order). XDG compliant (ZDOTDIR=~/.config/zsh). Smart completion caching (24hr recompile). Syntax highlighting, autosuggestions (dim gray, history+completion, 20 char buffer). Emacs keybindings, arrow key history search, fuzzy completion matching.</td>
  </tr>
  <tr>
    <td><img width="28" alt="XFCE" src="https://cdn.simpleicons.org/xfce/2284F2"></td>
    <td><a href="https://github.com/xfce-mirror/xfce4-terminal">XFCE4 Terminal</a></td>
    <td>Terminal emulator</td>
    <td>FiraCode Nerd Font Mono 11pt, custom purple/blue colorscheme (bg:#08052b, fg:#e3e3ea, cursor:#ff7f7f, bold:#7fbaff), 92% transparency, UNLIMITED scrollback (ScrollingLines=50000), 115x25 default geometry, no scrollbar, block cursor (no blink), URL highlighting, no unsafe paste dialog, no bell.</td>
  </tr>
  <tr>
    <td><img width="28" alt="starship" src="https://cdn.simpleicons.org/starship/DD0B78"></td>
    <td><a href="https://starship.rs"><code>starship</code></a></td>
    <td>Shell prompt</td>
    <td>Default configuration (no custom starship.toml). Loaded conditionally with fallback to minimal 2-line zsh prompt (blue path, yellow git branch, green arrow, right-side exit status). Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="atuin" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/atuinsh/atuin"><code>atuin</code></a></td>
    <td>Shell history management</td>
    <td>Fuzzy search mode, workspace filtering, global filter for up-key, 15-line inline height, preview enabled (6 lines max), Ctrl+N shortcuts. Secrets filtering: regex for ^secret, aws.*--secret, .*password.*, .*token.*, plus built-in detection (AWS keys, GitHub PAT, Slack tokens, Stripe keys). Auto-execute on Enter. Stats: git, docker, kubectl, npm, cargo, systemctl. Multi-filter priority: global > workspace > directory > session > host.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Ranger" src="https://cdn.simpleicons.org/python/3776AB"></td>
    <td><a href="https://github.com/ranger/ranger"><code>ranger</code></a></td>
    <td>File browser</td>
    <td>Minimal customization: ueberzug image previews, show hidden files, draw borders, auto-update folder sizes. Uses defaults for bulk operations and VCS integration (rc.conf only 13 lines).</td>
  </tr>
  <tr>
    <td><img width="28" alt="zoxide" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/ajeetdsouza/zoxide"><code>zoxide</code></a></td>
    <td>Smart directory jumping</td>
    <td>Default configuration with shell integration. Aliases: j → z, zd → remove, zf → fzf-enhanced fuzzy selection. Initialized via eval "$(zoxide init zsh)" in 20-plugins.zsh. Installed via mise.</td>
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
    <td>14 aliases in 30-coreutils.zsh: ll (long), la (all), lr (recursive), l. (dotfiles), lsnew/lsold (sort by modified), lsbig (sort by size), lst/lst2/lst3 (tree levels 1-3), lsg/lsga (git status). Color-always enabled. Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="bat" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/sharkdp/bat"><code>bat</code></a></td>
    <td>File viewer (replaces <code>cat</code>)</td>
    <td>Overrides cat/less. Aliases in 30-coreutils.zsh: b (bat), bp (plain), bl (line-range). FZF preview integration (color, numbers, 500-line limit). Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="fd" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/sharkdp/fd"><code>fd</code></a></td>
    <td>Fast file search (replaces <code>find</code>)</td>
    <td>13 aliases in 30-coreutils.zsh: ff (basic), fh (hidden), fd1/fd2/fd3 (depth limits), fdf/fdd (type file/dir), fde (extension), fdi (ignore-case), fds (size), fdx (exec), fdE (exclude). Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="ripgrep" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/BurntSushi/ripgrep"><code>ripgrep</code></a></td>
    <td>Text search (replaces <code>grep</code>)</td>
    <td>Overrides grep with case-insensitive color. 11 aliases in 30-coreutils.zsh: lgrep, sgrep (context=5), rgf (files), rgi (ignore-case), rgw (word), rgc (count), rgl (files-with-matches), rgh (hidden), rgn (no-ignore), rgt/rgT (type filters). Custom rg-search function with color, line numbers, heading. Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="fzf" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/junegunn/fzf"><code>fzf</code></a></td>
    <td>Fuzzy finder</td>
    <td>Custom opts: --height 40% --reverse --border. Ctrl+T for files (atuin overrides Ctrl+R). Bat preview (color, numbers, 500-line limit). Enhanced process killing for kill/killall/pkill with smart program name extraction (handles Java jars, Python scripts, Node.js apps). Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="btop" src="https://cdn.simpleicons.org/cplusplus/00599C"></td>
    <td><a href="https://github.com/aristocratos/btop"><code>btop</code></a></td>
    <td>System monitor (replaces <code>htop</code>)</td>
    <td>Overrides both top and htop commands (fallback to htop if btop unavailable). Default configuration (no custom config). Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="dust" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/bootandy/dust"><code>dust</code></a></td>
    <td>Disk usage (replaces <code>du</code>)</td>
    <td>Overrides du. 4 aliases in 30-coreutils.zsh: du1/dust1/dust2/dust3 (depth limits 1-3). Default configuration. Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="sd" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/chmln/sd"><code>sd</code></a></td>
    <td>Find & replace (replaces <code>sed</code>)</td>
    <td>Default configuration (no aliases or custom config). Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="delta" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/dandavison/delta"><code>delta</code></a></td>
    <td>Git diff viewer</td>
    <td>Set as GIT_PAGER. Full config in git/config: side-by-side, line numbers, navigate mode, Dracula theme, decorations (yellow commit headers, red file names, green line numbers), interactive diffFilter, colorMoved=default, histogram algorithm. Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="jq" src="https://cdn.simpleicons.org/c/A8B9CC"></td>
    <td><a href="https://github.com/jqlang/jq"><code>jq</code></a></td>
    <td>JSON processor</td>
    <td>Default configuration (no aliases or custom config). Used in i3blocks/weather script for OpenWeather API JSON parsing. Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="yq" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/mikefarah/yq"><code>yq</code></a></td>
    <td>YAML processor</td>
    <td>Default configuration (no aliases or custom config). Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="hyperfine" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/sharkdp/hyperfine"><code>hyperfine</code></a></td>
    <td>Benchmarking (replaces <code>time</code>)</td>
    <td>Default configuration (no aliases or custom config). Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="tokei" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/XAMPPRocky/tokei"><code>tokei</code></a></td>
    <td>Code statistics (replaces <code>cloc</code>)</td>
    <td>Default configuration (no aliases or custom config). Installed via mise.</td>
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
    <td>Via mise "latest" channel (not LTS-specific). No global npm config found. Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Python" src="https://cdn.simpleicons.org/python/3776AB"></td>
    <td><a href="https://github.com/python/cpython">Python</a></td>
    <td>Python runtime</td>
    <td>Via mise 3.12, pipx backend for global tools. XDG paths (UV_CACHE_DIR, PIP_CACHE_DIR). Pyenv build optimizations: --enable-optimizations, --with-lto, -march=native. pip.conf: trusted hosts, no compile. uv.toml: compile-bytecode, hardlink mode, highest resolution. Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Go" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/golang/go">Go</a></td>
    <td>Go runtime</td>
    <td>Via mise "latest". GOPATH=/opt/go (overridden from $HOME/go), GOBIN=$HOME/go/bin, CGO_ENABLED=1, GO111MODULE=on, GOCACHE=$HOME/.cache/go-build, GOPROXY=https://proxy.golang.org. Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Rust" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/rust-lang/rust">Rust</a></td>
    <td>Rust toolchain</td>
    <td>Via mise "stable" channel. Cargo bin at $HOME/.local, 4 parallel build jobs, tmp build dir (/tmp/rust-target), clang+lld linker. Installed via mise.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Bun" src="https://cdn.simpleicons.org/bun/000000"></td>
    <td><a href="https://github.com/oven-sh/bun">Bun</a></td>
    <td>JavaScript runtime / bundler</td>
    <td>Via mise "latest". XDG-compliant paths (globalDir=~/.local/share/bun, globalBinDir=~/.local/bin, cache=~/.cache/bun), peer=false, optional=false, test timeout=60000ms. Installed via mise.</td>
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
    <td>AstroNvim v5 base config. All customization files disabled (7 files with "if true then return {}" guard), default astrodark theme. Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="Sublime Text" src="https://cdn.simpleicons.org/sublimetext/FF9800"></td>
    <td><a href="https://www.sublimetext.com/">Sublime Text</a></td>
    <td>GUI text editor</td>
    <td>Mariana color scheme, Default Dark theme, font size 13, tabs→spaces, save on focus lost. 11 packages: GitGutter, BracketHighlighter, SublimeCodeIntel, Color Highlight, SideBarEnhancements, AdvancedNewFile, Compare Side-By-Side, Origami, Terminal, TrailingSpaces, GitSavvy.</td>
  </tr>
  <tr>
    <td><img width="28" alt="PyCharm" src="https://cdn.simpleicons.org/pycharm/000000"></td>
    <td><a href="https://www.jetbrains.com/pycharm/">PyCharm</a></td>
    <td>Python IDE</td>
    <td>Heap 2048m-4096m (vs default 256m-1500m), string deduplication enabled, SoftRefLRUPolicyMSPerMB=50, OpenGL acceleration, max filesize 51200KB, intellisense 15360KB, 7 indexing threads, zero-latency typing, fs sync 300ms, RAM disk paths (/tmp/pycharm-cache).</td>
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
    <td>Delta pager with Dracula syntax theme, side-by-side diffs, line numbers, decorations (yellow commit headers, red file names, green line numbers), diff3 conflict style, histogram algorithm, push.autoSetupRemote=true, pull.rebase=true, rerere enabled. 32 git aliases (conventional: gc, gcm, gca). Smart URL cleanup function (auto-cleans messy GitHub URLs). Custom functions: gitquick (quick commit all), gitroot (cd to repo root).</td>
  </tr>
  <tr>
    <td><img width="28" alt="lazygit" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/jesseduffield/lazygit"><code>lazygit</code></a></td>
    <td>Git TUI</td>
    <td>Default configuration (no custom config found). lg alias. Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="GitHub" src="https://cdn.simpleicons.org/github/181717"></td>
    <td><a href="https://github.com/cli/cli"><code>gh</code></a></td>
    <td>GitHub CLI</td>
    <td>Default configuration (no custom config found). Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="GitLab" src="https://cdn.simpleicons.org/gitlab/FC6D26"></td>
    <td><a href="https://github.com/profclems/glab"><code>glab</code></a></td>
    <td>GitLab CLI</td>
    <td>Default configuration (no custom config found). Installed via mise "latest".</td>
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
    <td>overlay2 storage, json-file logging (max-size=10m, max-file=3, compress=true), BuildKit enabled, live-restore=true, garbage collection (keepStorage=10GB, unused-for=168h), metrics on 127.0.0.1:9323, ulimits (nofile 32768/65536, nproc 2048/4096), systemd cgroup driver.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Docker Compose" src="https://cdn.simpleicons.org/docker/2496ED"></td>
    <td><a href="https://github.com/docker/compose">Docker Compose</a></td>
    <td>Multi-container orchestration</td>
    <td>COMPOSE_DOCKER_CLI_BUILD=1 env var. Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="lazydocker" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/jesseduffield/lazydocker"><code>lazydocker</code></a></td>
    <td>Docker TUI</td>
    <td>Default configuration (no custom config found). lzd alias. Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="Kubernetes" src="https://cdn.simpleicons.org/kubernetes/326CE5"></td>
    <td><a href="https://kubernetes.io/"><code>kubectl</code></a></td>
    <td>Kubernetes CLI</td>
    <td>KUBECTL_CONFIG=$XDG_CONFIG_HOME/kubectl. Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="k9s" src="https://cdn.simpleicons.org/kubernetes/326CE5"></td>
    <td><a href="https://k9scli.io/"><code>k9s</code></a></td>
    <td>Kubernetes TUI</td>
    <td>Default configuration (no custom config found). Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="Helm" src="https://cdn.simpleicons.org/helm/0F1689"></td>
    <td><a href="https://helm.sh/"><code>helm</code></a></td>
    <td>Kubernetes package manager</td>
    <td>Default configuration (no custom config found). Installed via mise "latest".</td>
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
    <td>Telemetry disabled (DISABLE_TELEMETRY=1), OTEL metrics/logs to localhost:4317, bash timeout 900000ms (15min), superpowers plugin enabled, alwaysThinkingEnabled=true, ccstatusline status command.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Glow" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/charmbracelet/glow"><code>glow</code></a></td>
    <td>Markdown viewer</td>
    <td>Default configuration (no custom config found). Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="Just" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/casey/just"><code>just</code></a></td>
    <td>Task runner</td>
    <td>Default configuration (no custom config found). Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="watchexec" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/watchexec/watchexec"><code>watchexec</code></a></td>
    <td>File watcher</td>
    <td>Default configuration (no custom config found). Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="direnv" src="https://cdn.simpleicons.org/go/00ADD8"></td>
    <td><a href="https://github.com/direnv/direnv"><code>direnv</code></a></td>
    <td>Environment manager</td>
    <td>Default configuration (no custom config found). Installed via mise "latest".</td>
  </tr>
  <tr>
    <td><img width="28" alt="bottom" src="https://cdn.simpleicons.org/rust/CE422B"></td>
    <td><a href="https://github.com/ClementTsang/bottom"><code>bottom</code></a></td>
    <td>System monitor</td>
    <td>Default configuration (no custom config found). btm alias. Installed via mise "latest".</td>
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
    <td>Arkenfox user.js overrides: session restore enabled, password manager disabled, GTK theme integration, internal domain resolution (.lan, .local, .internal), fingerprinting letterboxing disabled, Ctrl+Q disabled, backspace for back navigation, Pocket disabled. Addon configs: Tree Style Tab (userChrome.css customizations), uBlock Origin backup, Cookie AutoDelete backup.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Obsidian" src="https://cdn.simpleicons.org/obsidian/7C3AED"></td>
    <td><a href="https://obsidian.md/">Obsidian</a></td>
    <td>Note taking & knowledge management</td>
    <td>Minimal app settings: always update links enabled, spellcheck disabled, prompt delete disabled. 8 community plugins: editor-width-slider, table-editor-obsidian, dataview, advanced-canvas, obsidian-task-progress-bar, heatmap-calendar, obsidian-excalidraw-plugin, vextab.</td>
  </tr>
  <tr>
    <td><img width="28" alt="Kalu" src="https://cdn.simpleicons.org/linux/FCC624"></td>
    <td><a href="https://github.com/jjk-jacky/kalu">Kalu</a></td>
    <td>Update notifier</td>
    <td>120min (2hr) check interval. Auto checks: UPGRADES, WATCHED, AUR, WATCHED_AUR. Manual checks include NEWS. Click actions: single=last notifications, double=check, middle=toggle pause. Upgrade action: KALU built-in interface. Confirmation required for post-system upgrade.</td>
  </tr>
  <tr>
    <td><img width="28" alt="yay" src="https://cdn.simpleicons.org/linux/FCC624"></td>
    <td><a href="https://github.com/Jguer/yay">yay</a></td>
    <td>Package helper</td>
    <td>Comprehensive aliases in 75-arch.zsh: y (yay), aur/auri/aurs/auru/aurua (install/search/update), yi/yu (no-confirm install/update), yy (install with --needed --nodiffmenu --nocleanmenu), upall (full system update), pacclean (clears pacman + yay caches).</td>
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
