" Vim, not vi
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'make -f make_mingw32.mak',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \  },
  \ }

" My bundles
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'zhaocai/linepower.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'godlygeek/tabular'
NeoBundle 'vim-scripts/VOoM'
NeoBundle 'chikamichi/mediawiki.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box' 
NeoBundle 'vim-perl/vim-perl'
" NeoBundle 'xolox/vim-notes', {'depends': 'xolox/vim-misc'}
NeoBundle 'Rykka/riv.vim'
NeoBundle 'zhaocai/GoldenView.Vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'sudo.vim'
NeoBundle 'bufkill.vim'
NeoBundle 'DrawIt'
NeoBundle 'matchit.zip'
NeoBundle 'altercation/vim-colors-solarized'

" Filetype detection, using filetype plugin files, using indent files
filetype plugin indent on

NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
