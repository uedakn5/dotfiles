" 最後のカーソル位置を復元する
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
endif

if &term == "screen"
  let &titlestring = "vim(" . expand("%:t") . ")"
  set t_ts=k
  set t_fs=\
  set title
endif
autocmd VimEnter,TabEnter,WinEnter,BufReadPost,FileReadPost,BufNewFile * let &titlestring = 'vim(' . expand("%:t") . ')'

autocmd BufNewFile,BufRead *.php setfiletype php
autocmd BufNewFile,BufRead *.js setfiletype javascript
