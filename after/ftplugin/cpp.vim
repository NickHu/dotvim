" Completion
let marching_enable_neocomplete = 1
let marching_clang_command_option="-std=c++1z"
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)
