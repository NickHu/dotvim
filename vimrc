" Load vim.pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Vim, not vi
set nocompatible
set encoding=utf-8

" Turn on syntax highlighting
syntax on

" Filetype detection, using filetype plugin files, using indent files
filetype plugin indent on

" Last line's indent
set autoindent
" Indent more after certain structures
set smartindent

" Indent with two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Highlight search results
set hlsearch

" Highlight C stuff
let c_comment_strings=1
let c_space_errors=1

" Show matching bracket
set showmatch

" Start searching incrementally whilst typing
set incsearch

"" Don't wrap text
"set nowrap
" Break at nice places
set linebreak

" Grep command
set grepprg=grep\ -nH\ $*

" Tex flavour
let g:tex_flavor = "latex"

" Always show the statusline
set laststatus=2

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

" Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'

" Show line number gutter
set number

" Spell checking
set spell! spelllang=en_gb

" Always show mode
set showmode showcmd

" Solarized Dark
set background=dark
colorscheme solarized
