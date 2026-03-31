call plug#begin()

" Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/cdelledonne/vim-cmake'

" Fold stuff
" Plug 'https://github.com/kevinhwang91/promise-async'
" Plug 'https://github.com/kevinhwang91/nvim-ufo'

" Colorschemes
Plug 'https://github.com/ewilazarus/preto'
Plug 'https://github.com/fxn/vim-monochrome'

" mini
Plug 'https://github.com/nvim-mini/mini.nvim'

call plug#end()

lua require('mini.files').setup()
lua require('mini.move').setup()
nnoremap <silent> q :lua MiniFiles.open()<CR>

colorscheme habamax

" Fixes border issues in mini.files
lua vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
lua vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
" Makes the border thin (hard to know where to grab with mouse)
"lua vim.api.nvim_set_hl(0, "WinSeparator", { link = "Normal" })

set shiftwidth=4

set linebreak

set fo=

" g0 - public: and private: aren't indented
" N-s - stuff inside namespaces aren't indented
" (s - After an unclosed parenthesis, indent one tab rather than two
set cino=g0N-s(s

autocmd FileType c,cpp setlocal fo=c
set textwidth=60

nnoremap <silent> ; :TagbarToggle<CR>

let g:tagbar_sort = 0

" Adds line below or above but does not enter insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>

" Make x delete an empty line
nnoremap <silent> x :execute (getline('.') == '' ? 'normal! dd' : 'normal! x')<CR>

noremap 0 <nop>
noremap ^ <nop>
noremap $ <nop>
noremap y <nop>
"noremap p <nop>

noremap H ^
noremap J L
noremap K H
noremap L $

noremap <silent> <C-s> :w<CR>
vnoremap <C-x> <C-c>x
vnoremap <C-c> "+ygv

noremap Q <C-6>

" Only needed on Linux, does nothing on Windows
" Enables mouse interaction
set mouse=a
