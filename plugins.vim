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
if has("nvim")
  Plug 'benekastah/neomake'
  Plug 'euclio/vim-markdown-composer', { 'for': 'markdown.mkd.pandoc' }
  Plug 'kassio/neoterm'
  Plug 'Shougo/deoplete.nvim'
  Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
else
  Plug 'gregsexton/VimCalc', { 'on': 'Calc' }
  Plug 'osyo-manga/vim-marching', { 'for': ['c', 'cpp'] }
  Plug 'osyo-manga/vim-reunions', { 'for': ['c', 'cpp'] }
  Plug 'scrooloose/syntastic'
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/vimshell.vim', { 'on': 'VimShell' }
endif
Plug '907th/vim-auto-save'
Plug 'altercation/vim-colors-solarized'
Plug 'bitc/lushtags', { 'for': ['haskell', 'lhaskell'] }
Plug 'blindFS/vim-taskwarrior'
Plug 'bufkill.vim'
Plug 'chikamichi/mediawiki.vim', { 'for': 'mediawiki' }
Plug 'chrisbra/Colorizer'
Plug 'chrisbra/Recover.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'DrawIt'
Plug 'eagletmt/ghcmod-vim', { 'for': ['haskell', 'lhaskell'] }
Plug 'eagletmt/neco-ghc', { 'for': ['haskell', 'lhaskell'] }
Plug 'ensime/ensime-vim', { 'for': 'scala' }
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'honza/vim-snippets'
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
Plug 'IndexedSearch'
Plug 'jceb/vim-orgmode'
Plug 'jpalardy/vim-slime', { 'on': ['SlimeConfig', 'SlimeSend'] }
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'Konfekt/FastFold'
Plug 'kshenoy/vim-signature'
Plug 'lervag/vimtex', { 'for': 'tex' } 
Plug 'Lokaltog/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'matchit.zip'
Plug 'mattn/calendar-vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'mrtazz/simplenote.vim', { 'on': ['Simplenote', 'SimplenoteList'] }
Plug 'myusuf3/numbers.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell', 'lhaskell'] }
Plug 'osyo-manga/unite-quickfix'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown.mkd.pandoc' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neossh.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'sudo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Twinside/vim-haskellFold', { 'for': ['haskell', 'lhaskell'] }
Plug 'Twinside/vim-hoogle', { 'for': ['haskell', 'lhaskell'] }
Plug 'utl.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown.mkd.pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown.mkd.pandoc' }
Plug 'vim-perl/vim-perl', { 'for': 'perl' }
Plug 'VOoM', { 'on': 'VoomToggle' }
Plug 'wting/rust.vim', { 'for': 'rust' }
" Plug 'zhaocai/GoldenView.Vim'

" Filetype detection, using filetype plugin files, using indent files
filetype plugin indent on

call plug#end()
