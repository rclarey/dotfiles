"--- Auto install plugged ---
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"--- Plugins ---
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'dag/vim-fish'
call plug#end()

"--- Setting stuff ---
syntax enable
filetype plugin indent on
set nocompatible
set hlsearch
set showtabline=2
set tabstop=2
set shiftwidth=2
set expandtab
set number
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
