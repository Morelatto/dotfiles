# AstroNvim Configuration

**AstroNvim v5** - A feature-rich, aesthetically pleasing Neovim configuration that transforms your editor into a powerful IDE-like environment.

## 🛠️ Installation (Dotfiles Integration)

This AstroNvim configuration is managed through the dotfiles system:

```bash
# Install neovim via mise
mise install

# Deploy configuration
dotter deploy

# Launch AstroNvim (auto-installs plugins on first run)
nvim
```

## 🚀 Quick Start

### First Launch
1. **Start AstroNvim**: Run `nvim` to launch
2. **Plugin Installation**: First run automatically installs all 47 plugins
3. **Language Server Setup**: Install LSPs with `:LspInstall <server_name>`
4. **Syntax Highlighting**: Install parsers with `:TSInstall <language>`

### Essential Commands
```vim
:AstroUpdate          " Update AstroNvim and all plugins
:Lazy check          " Check for plugin updates
:Lazy sync           " Update and clean plugins
:Mason               " Open Mason package manager
:checkhealth         " Verify installation health
```

## 📁 File Structure

```
~/.config/nvim/
├── init.lua                 " Bootstrap file
├── lua/
│   ├── lazy_setup.lua      " Lazy.nvim configuration
│   ├── polish.lua          " Personal customizations
│   ├── community.lua       " Community plugins
│   └── plugins/            " Plugin configurations
│       ├── astrocore.lua   " Core features & mappings
│       ├── astrolsp.lua    " LSP configuration
│       ├── astroui.lua     " UI customizations
│       ├── mason.lua       " Package manager
│       ├── treesitter.lua  " Syntax highlighting
│       ├── none-ls.lua     " Formatting & linting
│       └── user.lua        " Your custom plugins
```

## ⚡ Core Features & Plugins

### Essential Plugins (Always Loaded)
1. **AstroNvim** - Core framework
2. **AstroCore** - Core functionality and mappings
3. **AstroUI** - User interface components
4. **AstroLSP** - Language Server Protocol integration
5. **AstroTheme** - Default color scheme
6. **Lazy.nvim** - Plugin manager
7. **Plenary.nvim** - Lua utilities

### File Management
- **Neo-tree** - File explorer (`<leader>e`)
- **Snacks Picker** - Fuzzy finder (`<leader>ff`, `<leader>fw`)
- **Resession** - Session management
- **Smart-splits** - Window management

### Editor Enhancement
- **Blink.cmp** - Autocompletion with snippets
- **LuaSnip** - Snippet engine
- **nvim-autopairs** - Auto-close brackets/quotes
- **better-escape** - Better escape key handling
- **which-key** - Keybinding help (`<leader>?`)

### Git Integration
- **Gitsigns** - Git status in sign column
- **Git blame**, **diff**, and **hunk** operations

### Language Support
- **nvim-lspconfig** - Language Server Protocol
- **Mason** - LSP/formatter/linter installer
- **nvim-treesitter** - Syntax highlighting
- **none-ls** - Formatting and linting

### Development Tools
- **nvim-dap** - Debug Adapter Protocol
- **nvim-dap-ui** - Debugging interface
- **toggleterm** - Terminal integration (`<leader>t`)
- **aerial** - Code outline/symbols

### UI Enhancement
- **Heirline** - Statusline, winbar, and bufferline
- **mini.icons** - File and folder icons
- **nvim-highlight-colors** - Color preview
- **todo-comments** - Highlight TODOs/FIXMEs

## ⌨️ Essential Keybindings

### Leader Key: `<Space>`
Local Leader: `,`

### File Operations
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>o` | Focus file explorer |
| `<leader>ff` | Find files |
| `<leader>fw` | Find words (grep) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help |
| `<leader>fm` | Find marks |
| `<leader>fo` | Find recent files |
| `<leader>fc` | Find commands |
| `<leader>fk` | Find keymaps |

### Buffer Management
| Key | Action |
|-----|--------|
| `<leader>c` | Close buffer |
| `<leader>C` | Force close buffer |
| `]b` | Next buffer |
| `[b` | Previous buffer |
| `<leader>b` | Buffer picker |

### Window Management
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate windows |
| `<C-Up/Down/Left/Right>` | Resize windows |
| `<leader>w` | Window operations |

### Git Integration
| Key | Action |
|-----|--------|
| `<leader>g` | Git menu |
| `]g` / `[g` | Next/previous git hunk |
| `<leader>gh` | Preview hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gu` | Undo stage hunk |
| `<leader>gb` | Git blame line |

### LSP (Language Server)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>lS` | Document symbols |
| `<leader>ls` | Workspace symbols |
| `<leader>lr` | Rename symbol |
| `<leader>la` | Code actions |
| `<leader>ld` | Diagnostics |

### Terminal
| Key | Action |
|-----|--------|
| `<leader>t` | Terminal menu |
| `<leader>tf` | Float terminal |
| `<leader>th` | Horizontal terminal |
| `<leader>tv` | Vertical terminal |
| `<C-\>` | Toggle terminal |

### Plugin Management
| Key | Action |
|-----|--------|
| `<leader>p` | Plugin menu |
| `<leader>pa` | AstroUpdate |
| `<leader>pm` | Mason |
| `<leader>pM` | Mason update all |
| `<leader>pl` | Lazy |
| `<leader>ps` | Lazy sync |

## 🎨 Customization

### Enabling Configuration Files
Most plugin configuration files in `lua/plugins/` start with:
```lua
if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
```
Remove this line to enable customization of that plugin.

### Adding Custom Plugins
Edit `lua/plugins/user.lua`:
```lua
return {
  -- Example: Add a custom plugin
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
  },
}
```

### Key Mapping Customization
In `lua/plugins/astrocore.lua`, modify the mappings section:
```lua
mappings = {
  n = {
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
  },
}
```

### Theme Customization
In `lua/plugins/astroui.lua`:
```lua
colorscheme = "astrotheme", -- Default theme
-- Or choose from: tokyonight, catppuccin, nord, etc.
```

## 🔧 Language Server Setup

### Installing Language Servers
```vim
:LspInstall lua_ls          " Lua
:LspInstall pyright         " Python
:LspInstall ts_ls           " TypeScript/JavaScript
:LspInstall rust_analyzer   " Rust
:LspInstall gopls           " Go
:LspInstall clangd          " C/C++
```

### Installing Formatters/Linters
```vim
:MasonInstall prettier      " JavaScript/TypeScript/CSS/HTML
:MasonInstall black         " Python formatter
:MasonInstall ruff          " Python linter
:MasonInstall stylua        " Lua formatter
:MasonInstall shfmt         " Shell script formatter
```

### Installing Treesitter Parsers
```vim
:TSInstall lua python typescript rust go c cpp bash
:TSInstall html css json yaml toml markdown
```

### Installing Debuggers
```vim
:DapInstall python          " Python debugger
:DapInstall node2           " Node.js debugger
:DapInstall chrome          " Chrome debugger
```

## 🚀 Performance Features

### Lazy Loading
- **Smart Loading**: Plugins load only when needed
- **Fast Startup**: ~30ms startup time with lazy loading
- **Memory Efficient**: Only active plugins consume memory

### Disabled Default Plugins
These standard Neovim plugins are disabled for better performance:
- `gzip`, `netrwPlugin`, `tarPlugin`, `tohtml`, `zipPlugin`

### Large File Handling
- **Auto-detection**: Files >256KB or >10K lines
- **Feature Reduction**: Disables heavy features for large files
- **Performance Maintained**: Editing remains responsive

## 🎯 Workflow Tips

### Project Setup
1. **Open project**: `nvim .` or `nvim project_folder`
2. **Install LSP**: `:LspInstall <language>` for your project languages
3. **Install parsers**: `:TSInstall <languages>`
4. **Session save**: `<leader>Ss` to save session

### Daily Workflow
1. **Find files**: `<leader>ff` for quick navigation
2. **Search content**: `<leader>fw` to find in files
3. **Git status**: `<leader>g` for git operations
4. **Terminal**: `<leader>tf` for floating terminal
5. **Diagnostics**: `<leader>ld` to see issues

### Debugging Setup
1. **Install debugger**: `:DapInstall <debugger>`
2. **Set breakpoints**: `<F9>` or `<leader>db`
3. **Start debugging**: `<F5>` or `<leader>dc`
4. **Step through**: `<F10>` (over), `<F11>` (into)

## 📚 Learning Resources

### Built-in Help
- `:h astronvim` - AstroNvim documentation
- `:h astrocore` - Core functionality help
- `:h astrolsp` - LSP configuration help
- `<leader>?` - Which-key help for current context

### Plugin Documentation
- `:Lazy` - Plugin manager interface
- `:Mason` - Language server manager
- `:checkhealth` - System health check
- `:TSPlayground` - Treesitter query playground

### Community Resources
- **AstroCommunity**: Pre-configured plugin packs
- **GitHub**: https://github.com/AstroNvim/AstroNvim
- **Discord**: Official AstroNvim community

## 🔄 Updates & Maintenance

### Regular Updates
```vim
:AstroUpdate        " Update everything (recommended)
:Lazy check         " Check for updates
:Lazy sync          " Update and clean plugins
:MasonUpdate        " Update language servers
```

### Backup Configuration
Your AstroNvim config is managed in your dotfiles at:
- `editors/nvim/` - Configuration files
- Deployed to `~/.config/nvim/` via dotter

### Troubleshooting
1. **Health check**: `:checkhealth` for system diagnostics
2. **Plugin issues**: `:Lazy log` to see plugin logs
3. **LSP issues**: `:LspInfo` for language server status
4. **Reset**: Delete `~/.local/share/nvim/lazy/` to reinstall plugins

## 🎉 Advanced Features

### Snippets
- **LuaSnip**: Powerful snippet engine
- **Friendly Snippets**: Pre-built snippet collection
- **Custom Snippets**: Add your own in snippet files

### Sessions
- **Auto-save**: Automatically saves session on exit
- **Project Sessions**: Per-directory session management
- **Quick restore**: `<leader>Sl` to load last session

### Workspaces
- **Multi-root**: Support for multiple project roots
- **LSP Workspaces**: Language servers work across roots
- **Find across**: Search/navigate across entire workspace
