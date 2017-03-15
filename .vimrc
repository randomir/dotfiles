:map <F4> :s_^#__<cr>
:map <F3> :s_^_#_<cr>
set tabstop=4
set shiftwidth=4
set expandtab
setglobal fileencoding=utf-8
syntax on

filetype plugin indent on
vmap <TAB> >gv
vmap <S-TAB> <gv

let g:neocomplete#enable_at_startup = 0
