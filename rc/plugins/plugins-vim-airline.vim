let g:airline_theme = 'murmur'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1

nmap gt <Plug>AirlineSelectNextTab
nmap gT <Plug>AirlineSelectPrevTab
noremap <Space>t :e 
