if 0 | endif
if &enc !=? 'utf-8' | let &tenc = &enc | set enc=utf-8 | endif
scripte utf-8
if &cp | set nocp | endif

let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
\ && (has('mac') || has('macunix') || has('gui_mac')
\ || (!executable('xdg-open') && system('uname') =~? '^darwin'))

if s:is_windows
	language messages ja_JP
elseif s:is_mac
	language messages C | language time C
else
	language messages C
endif

set hlg& hlg=ja,en
set shm& shm=atToOI
if has('guess_encode')
	set fencs=ucs-bom,utf-8,iso-2022-jp,guess,euc-jp,cp932,latin1
else
	set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,latin1
endif
set ffs=unix,dos

" Load all files in a:dir_target_relative_path on a:dir_root_abs_path
function! RuntimeAll(dir_target_relative_path, dir_root_abs_path) abort
	if isdirectory(a:dir_root_abs_path . '/' . a:dir_target_relative_path)
		execute 'runtime! ' . a:dir_target_relative_path . '/*.vim'
	endif
endfunction

let s:dotfiles_root_dir = expand('~/dotfiles')
let s:dir_rc = 'rc'
let s:dir_init = s:dir_rc . '/init'
let s:dir_dein = s:dir_rc . '/dein'

" Comment out on PRODUCTION env.
let g:is_development = 0

filetype plugin indent off

call RuntimeAll(s:dir_init, s:dotfiles_root_dir)

if get(g:, 'is_development', 0)
	call RuntimeAll(s:dir_dein, s:dotfiles_root_dir)
else
	colorscheme gruvbox
endif

filetype plugin indent on
syntax enable
