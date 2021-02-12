let g:mapleader = ","
"let g:maplocalleader = "m"
"nnoremap m <Nop>
nnoremap , <Nop>

inoremap <C-j> <esc> 
inoremap <C-f> <tab>
noremap <Space>h ^
noremap <Space>l $
nnoremap <esc><esc> :noh<Cr> 
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Space>= gg=G''
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap <Space>/ *
noremap ; :
noremap : ;
noremap <Space>t :tabnew 

if exists(':tnoremap')
  tnoremap <ESC> <C-\><C-n>
  tnoremap <C-j> <C-\><C-n>
endif

inoremap { {}<LEFT>
inoremap ( ()<ESC>i
inoremap [ []<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
