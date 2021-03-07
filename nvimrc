set encoding=utf-8
scriptencoding utf-8
colorscheme landscape
" colorscheme spacecamp
" colorscheme gruvbox

" Comment out on PRODUCTION env.
let s:is_development = 0

if &compatible | set nocompatible | endif
language message C

filetype plugin indent off

runtime! rc/init/*.vim
if get(s:, 'is_development', 0)
	runtime! rc/dein/*.vim
endif

filetype plugin indent on
syntax enable
