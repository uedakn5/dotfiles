imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
nnoremap <Space>c :NeoSnippetEdit<CR>
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
