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
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'Raimondi/delimitMate'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/VOoM'
Bundle 'sjl/gundo.vim'
Bundle 'gerw/vim-latex-suite' 
Bundle 'vim-perl/vim-perl'
Bundle 'xolox/vim-notes'
  Bundle 'xolox/vim-misc'
Bundle 'zhaocai/GoldenView.Vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/sudo.vim'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'altercation/vim-colors-solarized'

" Filetype detection, using filetype plugin files, using indent files
filetype plugin indent on

