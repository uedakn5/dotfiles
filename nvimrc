set encoding=utf-8
scriptencoding utf-8

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
let s:is_development = 0

if &compatible | set nocompatible | endif
language message C

filetype plugin indent off
syntax enable

call RuntimeAll(s:dir_init, s:dotfiles_root_dir)

if get(s:, 'is_development', 0)
	call RuntimeAll(s:dir_dein, s:dotfiles_root_dir)
endif

filetype plugin indent on
