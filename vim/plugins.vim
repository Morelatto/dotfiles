" Pathogen
execute pathogen#infect()
call pathogen#helptags()

" NERDTree
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=35
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" NERD Commenter
let g:NERDSpaceDelims = 1

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Lightline
let g:lightline = {'colorscheme': 'jellybeans'}

" Tagbar
nmap <F8> :TagbarToggle<CR>
