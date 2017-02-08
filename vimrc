" Use unicode {{{
set encoding=utf-8
" }}}

" Initialisation {{{
" set rtp=HOME/.vim,$VIMRUNTIME,$HOME/.vim/after
source ~/.vim/plugins.vim
source ~/.vim/sensitive.vim
" }}}

" Swap \ and , {{{
noremap \ ,
noremap , <Nop>
let mapleader=','
let maplocalleader=','
" }}}

" C indentation rules{{{
" set cindent
" }}}

" Indent with two spaces {{{
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" }}}

" 80 column rule {{{
set colorcolumn=80
set textwidth=80
" }}}

" Enable opening new buffers without needing to save existing changes {{{
set hidden
" }}}

" Highlight C stuff {{{
let c_comment_strings=1
let c_space_errors=1
" }}}

" Don't wrap text {{{
" set nowrap
" }}}

" Break at nice places {{{
set linebreak
set showbreak=…
" }}}

" Grep command {{{
set grepprg=grep\ -nH\ $*
" }}}

" Tex flavour {{{
let g:tex_flavor='latex'
" }}}

" LaTeXBox {{{
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_latexmk_options='-shell-escape -lualatex -output-directory=build'
let g:LatexBox_quickfix=2
let g:LatexBox_build_dir="build"
let g:LatexBox_Folding=1
" }}}

" vimtex {{{
let g:vimtex_latexmk_options="-pdf -verbose -file-line-error -synctex=1 -interaction=nonstopmode -lualatex"
" }}}

" Show line number gutter {{{
set number
" }}}

" Spell checking {{{
set spell! spelllang=en_gb
" }}}

" Fold markers by default {{{
set foldmethod=marker
" }}}

" Shortcut to rapidly toggle `set list` {{{
nmap <leader>l :set list!<CR>
" }}}
 
" Use the same symbols as TextMate for tabstops and EOLs {{{
set listchars=tab:▸\ ,eol:¬
" }}}

" Buffer killing {{{
nnoremap <silent> <leader>x :bd<CR>
nnoremap <silent> <leader>X :BD<CR>
" }}}

" sudo save {{{
command W w sudo:%
command Wq wq sudo:%
" }}}

" date {{{
command Date r!date "+\%A, \%-d \%B"
" }}}

" Vimproc remaps {{{
cnoreabbrev <expr> ! ((getcmdtype() is# ':' && getcmdpos()==2)?('VimProcBang'):('!'))
" }}}

" Unite {{{
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
" }}}

" Quiet autocompletion {{{
if has("patch-7.4.314")
  set shortmess+=c
endif
" }}}

" EchoDoc {{{
set noshowmode
let g:echodoc_enable_at_startup = 1
set completeopt-=preview
" }}}

if has("nvim")
  " Deoplete {{{
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1

  call deoplete#custom#set('_', 'converters',
    \ ['converter_auto_paren',
    \  'converter_auto_delimiter', 'remove_overlap'])
  " }}}

  " deoplete-clang {{{
  let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
  let g:deoplete#sources#clang#clang_header = "/usr/lib/clang" 
  " }}}
else
  " NeoComplete {{{
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplcache_min_syntax_length = 1
  let g:neocomplete#use_vimproc=1

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " For smart TAB completion.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>"
        \: <SID>check_back_space() ? "\<TAB>"
        \: neocomplete#start_manual_complete()
    function! s:check_back_space() "{{{
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction "}}}

  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.c =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
  let g:neocomplete#force_omni_input_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
  " }}}

  " Marching {{{
  let g:marching_clang_command = "clang"

  let g:marching_include_paths = filter(
    \ split(glob('/usr/include/c++/*'), '\n') +
    \ split(glob('/usr/include/*/c++/*'), '\n') +
    \ split(glob('/usr/include/*/'), '\n'),
    \ 'isdirectory(v:val)')
  "}}}
endif

" NeoSnippet {{{
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" let g:neosnippet#enable_completed_snippet = 1

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
" }}}

" Gundo {{{
nnoremap <silent> <F5> :GundoToggle<CR>
" }}}

" VOoM {{{
let g:voom_ft_modes=
  \ {
    \ 'tex': 'latex', 'mediawiki': 'wiki', 'rst': 'rest', 'org': 'org',
    \ 'html': 'html', 'mkd.markdown': 'pandoc', 'markdown.mkd.pandoc': 'pandoc'
  \ }
nnoremap <silent> <F7> :VoomToggle<CR>
" }}}

" VimFiler {{{
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

nnoremap <silent> <F6> :VimFilerExplorer<CR>
" }}}

" Tagbar {{{
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
" }}}

" simplenote.vim {{{
noremap <silent> <F9> :SimplenoteList<cr>
let g:SimplenoteUsername="me@nickhu.co.uk"
if exists("simplenotepassword")
  let g:SimplenotePassword=simplenotepassword
endif
let g:SimplenoteVertical=1
let g:SimplenoteFiletype="markdown"
" }}}

" Riv {{{
" let g:riv_global_leader = '<leader>e'
" let g:riv_fold_auto_update = 0
" let g:riv_default_path = '~/Documents/Notes'
" }}}

" Markdown {{{
let g:vim_markdown_math=1
let g:instant_markdown_autostart = 0
fun! PandocAddToFileType(ft)
  if index(split(&ft, '\.'), a:ft) == -1
    let &ft .= '.'.a:ft.'.pandoc'
  endif
endfun
au FileType markdown call PandocAddToFileType('mkd')
au FileType mkd      call PandocAddToFileType('markdown')
let g:pandoc#formatting#mode="hA"
let g:pandoc#formatting#smart_autoformat_on_cursormoved=1
let g:pandoc#command#latex_engine="lualatex"
let g:markdown_composer_autostart=0
" }}}

" ghc-mod {{{
" Type Lookup
map <silent> <leader>tw :GhcModTypeInsert<CR>
let g:necoghc_enable_detailed_browse = 1
" let g:ghcmod_open_quickfix_function = 'GhcModQuickFix'
" function! GhcModQuickFix()
"   " for unite.vim and unite-quickfix
"   :Unite -no-empty quickfix
" endfunction
au FileType haskell nnoremap <buffer> <silent> <F1> :GhcModType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :GhcModTypeClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :GhcModInfo<CR>
" au BufWritePost *.hs GhcModCheckAndLintAsync
" }}}

" haskell-mode {{{
" use ghc functionality for haskell files
" au BufEnter *.hs compiler ghc
" let g:haddock_browser="xdg-open"
" }}}

" hdevtools {{{
" au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
" }}}

" pointfree {{{
au BufEnter *.hs set formatprg=pointfree\ --stdin
" }}}

" ensime {{{
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.scala= '[^. *\t]\.\w*\|: [A-Z]\w*'
" }}}

" slime {{{
let g:slime_target="tmux"
" }}}

" Indent guides {{{
let g:indent_guides_enable_on_vim_startup=1
" }}}

" Numbers {{{
nnoremap <silent> <leader>0 :NumbersToggle<CR>
" }}}

" Golden view {{{
" let g:goldenview__enable_default_mapping=0

" nmap <silent> <leader>n <Plug>GoldenViewSplit
" nmap <silent> <leader><CR> <Plug>GoldenViewSwitchMain
" nmap <silent> <leader><BS> <Plug>GoldenViewSwitchToggle
" nmap <silent> <leader>j <Plug>GoldenViewNext
" nmap <silent> <leader>k <Plug>GoldenViewPrevious
" }}}

" Resizing {{{
" set winheight=30
" set winminheight=5
nnoremap <silent> <Up> :res +5<CR>
nnoremap <silent> <Down> :res -5<CR>
nnoremap <silent> <Right> :vertical res +5<CR>
nnoremap <silent> <Left> :vertical res -5<CR>
" nnoremap <silent> <Up> :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <Down> :exe "resize " . (winheight(0) * 2/3)<CR>
" nnoremap <silent> <Right> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
" nnoremap <silent> <Left> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
" }}}

" Rainbow parentheses {{{
let g:rainbow_active = 1
" }}}

" Fugitive {{{
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}

if has("nvim")
  " Neomake {{{
  let g:auto_make = 0
  function! AutoMakeToggle()
    if g:auto_make >= 1
      let g:auto_make = 0
      autocmd! Neomake BufWritePost *
    else
      let g:auto_make = 1
      augroup Neomake
      autocmd! BufWritePost * Neomake
      augroup END
    endif
  endfunction
  call AutoMakeToggle()
  command! AutoMakeToggle :call AutoMakeToggle()
  let g:neomake_open_list = 2
  " }}}
else
  " Syntastic {{{
  let g:syntastic_error_symbol='✗'
  let g:syntastic_style_error_symbol='S✗'
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_style_warning_symbol='S⚠'
  map <silent> <Leader>e :Errors<CR>
  map <Leader>s :SyntasticToggleMode<CR>
  let g:syntastic_auto_loc_list=0
  " }}}
endif

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}

" {{{ AutoSave
let g:auto_save = 0
let g:auto_save_in_insert_mode = 0
" }}}

" {{{ OrgMode
let g:org_agenda_files = ['~/Dropbox/org/*.org']
let g:org_indent = 1
" }}}

" {{{ NeoTerm
" Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>
noremap <silent> <F10> :Ttoggle<cr>
tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" }}}

" Solarized Dark {{{
set background=dark
colorscheme solarized
" }}}
