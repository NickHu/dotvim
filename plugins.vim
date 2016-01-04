" Vim, not vi
set nocompatible

" First run
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !touch ~/.vim/sensitive.vim
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/neossh.vim'
Plug 'osyo-manga/unite-quickfix'
if has("nvim")
  Plug 'Shougo/deoplete.nvim'
  Plug 'euclio/vim-markdown-composer', { 'for': 'markdown.mkd.pandoc' }
else
  Plug 'Shougo/neocomplete.vim'
  Plug 'gregsexton/VimCalc', { 'on': 'Calc' }
endif
Plug 'osyo-manga/vim-reunions', { 'for': ['c', 'cpp'] }
Plug 'osyo-manga/vim-marching', { 'for': ['c', 'cpp'] }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/vimshell.vim', { 'on': 'VimShell' }
Plug 'honza/vim-snippets'
Plug 'Shougo/vimfiler.vim'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'VOoM', { 'on': 'VoomToggle' }
Plug 'chikamichi/mediawiki.vim', { 'for': 'mediawiki' }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'tex' } 
Plug 'jpalardy/vim-slime', { 'on': ['SlimeConfig', 'SlimeSend'] }
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-perl/vim-perl', { 'for': 'perl' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'eagletmt/ghcmod-vim', { 'for': ['haskell', 'lhaskell'] }
Plug 'eagletmt/neco-ghc', { 'for': ['haskell', 'lhaskell'] }
Plug 'bitc/lushtags', { 'for': ['haskell', 'lhaskell'] }
Plug 'Twinside/vim-haskellFold', { 'for': ['haskell', 'lhaskell'] }
Plug 'Twinside/vim-hoogle', { 'for': ['haskell', 'lhaskell'] }
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell', 'lhaskell'] }
Plug 'mrtazz/simplenote.vim', { 'on': 'Simplenote' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown.mkd.pandoc' }
Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown.mkd.pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown.mkd.pandoc' }
Plug 'zhaocai/GoldenView.Vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'myusuf3/numbers.vim'
Plug 'Konfekt/FastFold'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'IndexedSearch'
Plug 'sudo.vim'
Plug 'bufkill.vim'
Plug 'DrawIt'
Plug 'matchit.zip'
Plug 'altercation/vim-colors-solarized'

" Filetype detection, using filetype plugin files, using indent files
filetype plugin indent on

call plug#end()
