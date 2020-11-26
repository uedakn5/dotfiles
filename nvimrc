set encoding=utf-8
scriptencoding utf-8

if &compatible | set nocompatible | endif
language message C

filetype plugin indent off

runtime! rc/init/*.vim
" runtime! rc/dein/*.vim "Comment out if using plain .nvimrc

syntax on
filetype plugin indent on
