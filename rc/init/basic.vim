set ignorecase " 検索時に大文字小文字無視
set smartcase  " 検索文字に大文字小文字があれば無視しない
set hlsearch   " 検索文字をハイライトする
set incsearch  " 検索ワードの最初の文字を入力した時点で検索を開始

set noswapfile " スワップファイル使わない
set nobackup   " バックアップ使わない

set hidden     " バッファを保存せずに移動可能
set autoread   " 他の場所で更新されたら自動的に読み込む

autocmd InsertLeave * set nopaste " Escの際にpaste modeから出る
