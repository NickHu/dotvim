" Vundle
" Vim, not vi
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()

Bundle 'gmarik/vundle'

" My bundles
Bundle 'Lokaltog/vim-powerline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tomtom/tlib_vim.git'
Bundle 'tomtom/trag_vim.git'
Bundle 'tomtom/viki_vim.git'
Bundle 'tomtom/vikitasks_vim.git'
Bundle 'altercation/vim-colors-solarized'

" Filetype detection, using filetype plugin files, using indent files
filetype plugin indent on


