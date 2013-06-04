" Vundle
" Vim, not vi
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()

Bundle 'gmarik/vundle'

" My bundles
Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree.git'
Bundle 'vim-scripts/VOoM.git'
Bundle 'xolox/vim-notes.git'
  Bundle 'xolox/vim-misc.git'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/sudo.vim'
Bundle 'altercation/vim-colors-solarized'

" Filetype detection, using filetype plugin files, using indent files
filetype plugin indent on

