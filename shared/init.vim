" Must run PlugInstall
call plug#begin()

" Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/cdelledonne/vim-cmake'

" Colorschemes
Plug 'https://github.com/ewilazarus/preto'
Plug 'https://github.com/fxn/vim-monochrome'

call plug#end()

" If in Windows:
"colorscheme habamax

set shiftwidth=4

" g0 - public: and private: aren't indented
" N-s - stuff inside namespaces aren't indented
" (s - After an unclosed parenthesis, indent one tab rather than two
set cino=g0N-s(s

nnoremap <silent> ; :TagbarToggle<CR>

let g:tagbar_sort = 0

" Adds line below or above but does not enter insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>

" Make x delete an empty line
nnoremap <silent> x :execute (getline('.') == '' ? 'normal! dd' : 'normal! x')<CR>

" Only needed in Linux, test for Windows
" Enables mouse interaction
set mouse=a
