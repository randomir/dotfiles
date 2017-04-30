set tabstop=4
set shiftwidth=4
set expandtab
setglobal fileencoding=utf-8
syntax on

" comment with Ctrl+K, C and uncomment with Ctrl+K, U
map <C-k>c :s_^_#_<cr>
map <C-k>u :s_^#__<cr>

" indent/dedent with tab/shift-tab
filetype plugin indent on
vmap <TAB> >gv
vmap <S-TAB> <gv

let g:neocomplete#enable_at_startup = 0
