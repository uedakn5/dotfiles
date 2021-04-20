augroup MyAutoCmd
  autocmd!
augroup END

if has('nvim')
  let s:vim_root_dir = expand('~/.config/nvim')
else
  let s:vim_root_dir = expand('~/.vim')
endif

let s:dein_dir = s:vim_root_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

if has('vim_starting')
  execute 'set runtimepath+=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  let g:dein#cache_directory = $HOME . '/.cache/dein'
  call dein#begin(s:dein_dir)

  let g:toml_dir    = s:vim_root_dir . '/rc/dein'
  let s:toml      = g:toml_dir . '/dein.toml'
  let s:lazy_toml = g:toml_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

function! s:deinClean()
  if len(dein#check_clean())
    call map(dein#check_clean(), 'delete(v:val, "rf")')
  else
    echo '[ERR] no disabled plugins'
  endif
endfunction
command! DeinClean :call s:deinClean()
