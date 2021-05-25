set lazyredraw       "スクロール速度
set ttyfast
set nofoldenable

set tabstop=2        "読み込み時の<TAB>サイズ
set softtabstop=2    "入力時の<TAB>サイズ
set shiftwidth=2     "自動インデントサイズ
" set expandtab        "タブを空白に変換
set autoindent       "インデントを自動で補完
set smartindent      "末尾に応じてインデントの増減
set smarttab         "行頭余白内で<TAB>を打ち込むと'shiftwidth'の数だけインデント
set nolist             "不可視文字

set number           "行番号を表示
set ruler            "カーソル位置を表示
set cursorline       "現在行をハイライト

set background=dark  "背景暗く
set showmatch        "対応する括弧を表示
set matchtime=1
set whichwrap=b,s,h,l,<,>,[,]
set ambiwidth=single "特殊記号が崩れないように(For iTerm2)

set display+=lastline
if &ft != 'man' || &ft != 'help'
	set colorcolumn=100
endif

function! ZenkakuSpace() "全角スペース可視化
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme * call ZenkakuSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()
endif

" ステータスライン関連 {{{
set cmdheight=1
set laststatus=2
set statusline=[%n]
set statusline+=%<%F\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set notitle
set nowildmenu
set wildmode=longest,list
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll
set showcmd
set browsedir=buffer
" }}}

" サインコラムを常に表示する
:sign define dummy
:execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

autocmd ColorScheme * highlight Structure ctermfg=205 guifg=#008800

autocmd ColorScheme * highlight NormalNC ctermfg=251 ctermbg=17 guifg=#a0a0a0 guibg=#121212
autocmd WinEnter,BufWinEnter * setlocal wincolor=
autocmd WinLeave * setlocal wincolor=NormalNC

set vb
set t_vb=
set guicursor=
set t_Co=256
set t_ut=
syn sync minlines=100 "起動時の描画が遅いので追加
set redrawtime=10000
