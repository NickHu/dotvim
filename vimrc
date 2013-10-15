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

" 80 column rule
set colorcolumn=80

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

" Buffer killing
nnoremap <silent> <leader>x :bd<CR>
nnoremap <silent> <leader>X :BD<CR>

" Unite
call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async',
\ 'matchers', 'matcher_fuzzy')
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_source_grep_max_candidates = 200

if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
  \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
  \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <silent> <leader>/ :Unite grep:.<CR>
nnoremap <silent> <leader>f :Unite -start-insert file<CR>
nnoremap <silent> <leader>r :Unite -start-insert file_rec/async<CR>
nnoremap <silent> <leader>b :Unite -quick-match buffer<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <silent> <leader>y :Unite history/yank<CR>

let g:unite_force_overwrite_statusline = 0

" NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" NeoSnippet
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Gundo
nnoremap <silent> <F5> :GundoToggle<CR>

" VOoM
let g:voom_ft_modes=
  \ {
    \ 'tex': 'latex', 'mediawiki': 'wiki', 'rst': 'rest', 'html': 'html'
  \ }
nnoremap <silent> <F6> :VoomToggle<CR>

" VimFiler
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

nnoremap <silent> <F7> :VimFilerExplorer<CR>

" Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

"Riv
let g:riv_global_leader = '<leader>e'
let g:riv_fold_auto_update = 0
let g:riv_default_path = '~/Documents/Notes'

" Indent guides
let g:indent_guides_enable_on_vim_startup=1

" Golden view
let g:goldenview__enable_default_mapping=0

nmap <silent> <leader>n <Plug>GoldenViewSplit
nmap <silent> <leader><CR> <Plug>GoldenViewSwitchMain
nmap <silent> <leader><BS> <Plug>GoldenViewSwitchToggle
nmap <silent> <leader>j <Plug>GoldenViewNext
nmap <silent> <leader>k <Plug>GoldenViewPrevious

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Solarized Dark
set background=dark
colorscheme solarized
