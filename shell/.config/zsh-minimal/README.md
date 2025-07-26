# Enhanced Minimal Zsh Configuration

A modular, scalable, and minimal Zsh configuration without Oh My Zsh or other frameworks.

## Structure

```
zsh-minimal/
├── zshenv                      # Environment variables loaded for all shells
├── zshrc                       # Main configuration file
├── config/                     # Core configuration modules
│   ├── aliases/                # Organized alias files
│   │   ├── core.zsh           # Basic system aliases
│   │   ├── arch.zsh           # Arch Linux specific (pacman, yay, systemd)
│   │   ├── git.zsh            # Git shortcuts
│   │   ├── global.zsh         # Zsh global aliases
│   │   ├── development.zsh    # Docker, Python, Gradle, Maven
│   │   └── network.zsh        # Network utilities
│   ├── completion.zsh         # Tab completion settings
│   ├── environment.zsh        # Environment variables
│   ├── functions.zsh          # Useful shell functions
│   ├── keybindings.zsh        # Key bindings
│   ├── options.zsh            # Zsh options and settings
│   └── prompt.zsh             # Prompt configuration
└── functions/                  # Autoloaded functions
```

## Features

### Aliases
- **Core**: Navigation, file operations, common tools
- **Arch Linux**: Full pacman/yay/systemd integration
- **Git**: Comprehensive git workflow shortcuts
- **Global**: Zsh-specific global aliases for piping
- **Development**: Docker, Python, Poetry, Gradle, Maven
- **Network**: Network tools and diagnostics

### Functions
- `mkcd`: Create and enter directory
- `extract`: Extract various archive formats
- `backup`: Create timestamped backups
- `psgrep`: Find processes by name
- `myip`: Show local and public IP addresses
- `weather`: Terminal weather display
- `calc`: Command-line calculator
- And more...

### Environment
- XDG Base Directory compliance
- Development tool paths (pyenv, poetry, go, cargo)
- FZF configuration
- Optimized PATH management

## Installation

1. Clone to `~/.config/zsh-minimal/`
2. Set `ZDOTDIR` in your shell:
   ```bash
   export ZDOTDIR="$HOME/.config/zsh-minimal"
   ```
3. Start a new zsh session

## Adding Custom Configuration

1. **New aliases**: Create a file in `config/aliases/`
2. **New functions**: Add to `config/functions.zsh` or create files in `functions/`
3. **Environment variables**: Add to `config/environment.zsh`
4. **Zsh options**: Add to `config/options.zsh`

All `.zsh` files in the config directories are automatically loaded.

## Philosophy

- Minimal but functional
- Modular and easy to extend
- Fast startup time
- No external dependencies (works with vanilla Zsh)
- Organized by concern for easy maintenance