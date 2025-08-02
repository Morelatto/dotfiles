" Enhanced Neovim Configuration
" =============================

" UI Settings
" -----------
set number                      " Show line numbers
set relativenumber              " Show relative line numbers
set signcolumn=yes              " Always show sign column to prevent shifting
set cursorline                  " Highlight current line
set showmatch                   " Show matching brackets
set termguicolors               " Enable 24-bit RGB colors

" Editor Behavior
" ---------------
set expandtab                   " Use spaces instead of tabs
set tabstop=4                   " Tab width
set shiftwidth=4                " Indent width
set softtabstop=4               " Soft tab width
set smartindent                 " Smart autoindenting
set autoindent                  " Copy indent from current line

" Search Settings
" ---------------
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive if uppercase present
set hlsearch                    " Highlight search results
set incsearch                   " Incremental search

" Text Rendering
" --------------
set wrap                        " Enable line wrapping
set linebreak                   " Wrap at word boundaries
set scrolloff=8                 " Keep 8 lines visible above/below cursor
set sidescrolloff=8             " Keep 8 columns visible left/right of cursor

" System Integration
" ------------------
set mouse=a                     " Enable mouse support in all modes
set clipboard=unnamedplus       " Use system clipboard
set updatetime=300              " Faster completion (default: 4000ms)
set timeoutlen=500              " Faster key sequence completion

" File Management
" ---------------
set hidden                      " Allow switching buffers without saving
set autowrite                   " Auto save before commands like :next
set undofile                    " Persistent undo
set undodir=~/.config/nvim/undo " Undo directory
set undolevels=1000             " Maximum undo levels
set undoreload=10000            " Maximum lines to save for undo on reload

" Backup and Swap
" ---------------
set nobackup                    " Don't create backup files
set nowritebackup               " Don't create backup before overwriting
set noswapfile                  " Don't create swap files

" Interface Improvements
" ----------------------
set splitbelow                  " Horizontal splits open below
set splitright                  " Vertical splits open to the right
set wildignorecase              " Case insensitive file completion
set shortmess+=c                " Don't show completion messages
set completeopt=menuone,noselect,preview " Better completion experience

" Display Settings
" ----------------
set list                        " Show invisible characters
set listchars=tab:▸\ ,trail:·,nbsp:␣,extends:›,precedes:‹ " Define invisible characters
set fillchars=vert:│,fold:·     " Better looking splits

" Performance
" -----------
set lazyredraw                  " Don't redraw during macros
set synmaxcol=300               " Only syntax highlight first 300 columns

" Key Mappings
" ------------
" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>gv

" Clear search highlight with Escape
nnoremap <Esc> :nohlsearch<CR><Esc>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Better indenting in visual mode
vnoremap < <gv
vnoremap > >gv

" Auto Commands
" -------------
" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   execute "normal! g`\""
    \ | endif

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Create directories when saving a file
autocmd BufWritePre * 
    \ if !isdirectory(expand("<afile>:p:h")) 
    \ |   call mkdir(expand("<afile>:p:h"), "p")
    \ | endif

" Highlight yanked text briefly
autocmd TextYankPost * silent! lua vim.highlight.on_yank{timeout=150}

" File Type Specific Settings
" ---------------------------
" Python
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" JavaScript/TypeScript
autocmd FileType javascript,typescript,javascriptreact,typescriptreact setlocal expandtab shiftwidth=2 softtabstop=2

" YAML/JSON
autocmd FileType yaml,json setlocal expandtab shiftwidth=2 softtabstop=2

" Markdown
autocmd FileType markdown setlocal wrap linebreak spell

" Color Scheme
" ------------
" Try to load a better colorscheme, fallback to default
silent! colorscheme slate