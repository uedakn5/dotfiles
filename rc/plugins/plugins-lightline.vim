set nosmd
set stal=2

let g:lightline = {}
let g:lightline.colorscheme = 'molokai'
let g:lightline.mode_map = {'c': 'NORMAL'}
let g:lightline.active = {
				\   'left': [
				\     ['mode', 'paste'],
				\     ['readonly', 'filename'],
				\     ['fugitive', 'gitgutter'],
				\   ],
				\   'right': [
				\     ['fileformat', 'fileencoding', 'filetype'],
				\     ['lineinfo', 'percent'],
				\			['whitespace'],
				\   ]
				\}
let g:lightline.tabline = {
				\	 'left': [['tabs']],
				\  'right': [],
				\}

let g:lightline.component_function = {
				\  'modified': 'MyModified',
				\  'readonly': 'MyReadonly',
				\  'fugitive': 'MyFugitive',
				\  'filename': 'MyFilename',
				\  'fileformat': 'MyFileformat',
				\  'filetype': 'MyFiletype',
				\  'fileencoding': 'MyFileencoding',
				\  'mode': 'MyMode',
				\  'syntastic': 'SyntasticStatuslineFlag',
				\  'charcode': 'MyCharCode',
				\  'gitgutter': 'MyGitGutter',
				\}

let g:lightline.component_expand = {
				\	 'whitespace': 'lightline#whitespace#check'
				\}

let g:lightline.component_type = {
				\  'whitespace': 'warning'
				\}

let g:lightline.separator = {
				\  'left': "\ue0b0",
				\  'right': "\ue0b2",
				\}

let g:lightline.subseparator = {
        \  'left': "\ue0b1",
				\  'right': "\ue0b3" ,
				\}

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . (exists('*WebDevIconsGetFileTypeSymbol') ? ' ' . WebDevIconsGetFileTypeSymbol() : ''): 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . '[' . hunks[i] . ']')
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction
