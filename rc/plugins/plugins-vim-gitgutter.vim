let g:gitgutter_sign_modified_removed = '∙'

set signcolumn=yes
set ut=100
nnoremap <C-l> <C-l>:GitGutterAll<CR>

nnoremap ]g :GitGutterNextHunk<CR>
nnoremap [g :GitGutterPrevHunk<CR>
