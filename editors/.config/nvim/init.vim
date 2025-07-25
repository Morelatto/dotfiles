" EndeavourOS Neovim Configuration
" Basic settings optimized for EndeavourOS

" General Settings
set number              " Show line numbers
set relativenumber      " Relative line numbers
set autoindent          " Auto indent
set tabstop=4           " Tab width
set shiftwidth=4        " Indent width
set smarttab            " Smart tabs
set softtabstop=4       " Soft tab stop
set mouse=a             " Enable mouse
set encoding=utf-8      " UTF-8 encoding

" UI Settings
set cursorline          " Highlight current line
set showmatch           " Show matching brackets
set wildmenu            " Visual autocomplete for command menu
set laststatus=2        " Always show status line

" Search Settings
set ignorecase          " Case insensitive search
set smartcase           " Case sensitive when uppercase present
set hlsearch            " Highlight search results
set incsearch           " Incremental search

" File Settings
set noswapfile          " Disable swap files
set nobackup            " Disable backup files
set undofile            " Enable persistent undo
set undodir=~/.config/nvim/undo

" Create undo directory if it doesn't exist
if !isdirectory(expand('~/.config/nvim/undo'))
    call mkdir(expand('~/.config/nvim/undo'), 'p')
endif

" Color scheme (works well with EndeavourOS themes)
syntax enable
set background=dark

" Key mappings
let mapleader = " "     " Space as leader key

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clear search highlight
nnoremap <leader><space> :nohlsearch<CR>

" EndeavourOS specific: integrate with system clipboard
set clipboard=unnamedplus

" File type specific settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab