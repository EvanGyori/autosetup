call plug#begin()

" Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/cdelledonne/vim-cmake'

" Colorschemes
Plug 'https://github.com/ewilazarus/preto'
Plug 'https://github.com/fxn/vim-monochrome'

call plug#end()

colorscheme habamax

nnoremap <silent> ; :TagbarToggle<CR>

" Adds line below or above but does not move cursor or enter insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>

" Make x delete an empty line
nnoremap <silent> x :execute (getline('.') == '' ? 'normal! dd' : 'normal! x')<CR>
