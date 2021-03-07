let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0
let g:neocomplcache_temporary_dir = $HOME.'/tmp/.neocon'
let g:neocomplcache_snippets_disable_runtime_snippets = 1
let g:neocomplcache_snippets_dir = $HOME.'/.vim/rc/snippets'
inoremap <expr><C-Space> neocomplcache#manual_omni_complete()
