let g:rbpt_colorpairs = [
      \ ['blue',       '#FF6000'],
      \ ['cyan', '#00FFFF'],
      \ ['darkmagenta',    '#CC00FF'],
      \ ['yellow',   '#FFFF00'],
      \ ['red',     '#FF0000'],
      \ ['darkgreen',    '#00FF00'],
      \ ['White',         '#c0c0c0'],
      \ ['blue',       '#FF6000'],
      \ ['cyan', '#00FFFF'],
      \ ['darkmagenta',    '#CC00FF'],
      \ ['yellow',   '#FFFF00'],
      \ ['red',     '#FF0000'],
      \ ['darkgreen',    '#00FF00'],
      \ ['White',         '#c0c0c0'],
      \ ['blue',       '#FF6000'],
      \ ['cyan', '#00FFFF'],
      \ ['darkmagenta',    '#CC00FF'],
      \ ['yellow',   '#FFFF00'],
      \ ['red',     '#FF0000'],
      \ ['darkgreen',    '#00FF00'],
      \ ['White',         '#c0c0c0'],
      \ ]
let g:rbpt_max = 21

aug MyParentheses
  au!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
aug END
" if RainbowParentheses is deactivated, press <Space>r to activate
nnoremap <Space>r :RainbowParenthesesLoadRound<Cr>:RainbowParenthesesLoadBraces<Cr>:RainbowParenthesesLoadSquare<Cr>
