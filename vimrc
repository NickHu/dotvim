" Use unicode
set encoding=utf-8
set rtp=HOME/.vim,$VIMRUNTIME,$HOME/.vim/after
source ~/.vim/bundles.vim

" Swap \ and ,
noremap \ ,
noremap , <Nop>
let mapleader=','
let maplocalleader=','

" Indent more after certain structures
"set smartindent

" Indent with two spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Enable opening new buffers without needing to save existing changes
set hidden

" Highlight C stuff
let c_comment_strings=1
let c_space_errors=1

"" Don't wrap text
"set nowrap
" Break at nice places
set linebreak
set showbreak=…

" Grep command
set grepprg=grep\ -nH\ $*

" Tex flavour
let g:tex_flavor='latex'
let g:LatexBox_latexmk_options='-xelatex'

" Show line number gutter
set number

" Spell checking
set spell! spelllang=en_gb

" Always show mode
set showmode

" Fold markers by default
set foldmethod=marker
"
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" ctrlp
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" Syntastic
let g:syntastic_c_checkers=['ycm']

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>"

" Gundo
nnoremap <F5> :GundoToggle<CR>

" VOoM
let g:voom_ft_modes={'tex': 'latex', 'mediawiki': 'wiki', 'rst': 'rest', 'html': 'html'}
nnoremap <F6> :VoomToggle<CR>

" NERDTree
nnoremap <F7> :NERDTreeToggle<CR>

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

" Vim notes
let g:notes_directories=['~/Documents/Notes']

" Indent guides
let g:indent_guides_enable_on_vim_startup=1

" Golden view
let g:goldenview__enable_default_mapping=0

nmap <silent> <leader>n <Plug>GoldenViewSplit
nmap <silent> <leader><CR> <Plug>GoldenViewSwitchMain
nmap <silent> <leader><BS> <Plug>GoldenViewSwitchToggle
nmap <silent> <leader>j <Plug>GoldenViewNext
nmap <silent> <leader>k <Plug>GoldenViewPrevious

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:powerline_config_overrides={'ext': {'vim': {'colorscheme': 'solarized'}}}

" Solarized Dark
set background=dark
colorscheme solarized
