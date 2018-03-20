"""""""""""""""""""""""
" Load pathogen paths "
"""""""""""""""""""""""

execute pathogen#infect()
call pathogen#helptags()

"""""""""""""
" Nerd Tree "
"""""""""""""

let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"""""""""
" Gundo "
"""""""""

nnoremap <F5> :GundoToggle<CR>

"""""""""""""
" Lightline "
"""""""""""""

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

""""""""""""""""""
" Nerd Commenter "
""""""""""""""""""

let g:NERDSpaceDelims = 1

""""""""""
" Tagbar "
""""""""""

nmap <F8> :TagbarToggle<CR>
