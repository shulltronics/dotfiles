set termguicolors

" Change our colorscheme based on the env variable
let cs = $HI
if cs
    set background=light
else
    set background=dark
endif
colorscheme solarized8

set mouse=a
set nowrap
set number
syntax on
" Integrate Vim yank and paste with the X clipboard
set clipboard=unnamedplus
" Expands tabs into four spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Fold code based on indent
set foldmethod=indent
