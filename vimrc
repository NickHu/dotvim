" Use unicode
set encoding=utf-8
set rtp=$HOME/.vim,$VIMRUNTIME,$HOME/.vim/after
source ~/.vim/bundles.vim

" Turn on syntax highlighting
syntax on

" Last line's indent
set autoindent

" Indent more after certain structures
set smartindent

" Indent with two spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Enable opening new buffers without needing to save existing changes
set hidden

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
set showbreak=…

" Grep command
set grepprg=grep\ -nH\ $*

" Tex flavour
let g:tex_flavor = 'latex'

" Always show the statusline
set laststatus=2

" Show line number gutter
set number

" Spell checking
set spell! spelllang=en_gb

" Always show mode
set showmode showcmd

" Fold markers by default
set foldmethod=marker
"
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_theme = 'solarized256'
" let g:Powerline_colorscheme = 'solarized256'

" Solarized Dark
set background=dark
colorscheme solarized
