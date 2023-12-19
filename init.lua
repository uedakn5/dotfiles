vim.cmd("autocmd!")

if vim.o.cp then
  vim.o.nocp = true
end

vim.cmd([[language messages C]])

vim.cmd([[set hlg& hlg=ja,en]])
vim.cmd([[set shm& shm=atToOI]])

if vim.fn.has('guess_encode') then
  vim.opt.fileencodings = 'ucs-bom,utf-8,iso-2022-jp,guess,euc-jp,cp932,latin1'
else
  vim.opt.fileencodings = 'ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,latin1'
end

vim.opt.fileformats = 'unix,dos'

-- basic.vim

vim.opt.ignorecase = true -- Αγνόηση πεζών/κεφαλαίων κατά την αναζήτηση
vim.opt.smartcase = true -- Έξυπνη αναζήτηση: χρησιμοποίησε πεζούς/κεφαλαίους αν υπάρχουν στο αναζητούμενο
vim.opt.hlsearch = true -- Υψηλή φωτεινότητα για το κείμενο κατά την αναζήτηση
vim.opt.incsearch = true -- Έναρξη αναζήτησης με τον πρώτο χαρακτήρα της λέξης
vim.opt.swapfile = false -- Απενεργοποίηση δημιουργίας αρχείων ανταλλαγής
vim.opt.backup = false -- Απενεργοποίηση δημιουργίας αρχείων αντιγραφής ασφαλείας
vim.opt.hidden = true -- Κρυφό buffer: δυνατότητα αλλαγής buffer χωρίς αποθήκευση
vim.opt.autoread = true -- Αυτόματη ανάγνωση αρχείου όταν αυτό αλλάξει από άλλη πηγή

-- Απενεργοποίηση της λειτουργίας paste mode όταν βγαίνουμε από την κατάσταση Insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste"
})

-- keymaps.vim
vim.g.mapleader = ","  -- Ορισμός του leader ως κόμμα
vim.api.nvim_set_keymap('n', ',', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-f>', '<tab>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>h', '^', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>l', '$', { noremap = true })
vim.api.nvim_set_keymap('n', '<esc><esc>', ':noh<Cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>=', 'gg=G\'\'', { noremap = true })
vim.api.nvim_set_keymap('n', 'O', ':<C-u>call append(expand(\'.\'), \'\')<Cr>j', { noremap = true })
vim.api.nvim_set_keymap('n', 'ZZ', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ZQ', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', 'Q', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>/', '* ', { noremap = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', ':', ';', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>t', ':tabnew', { noremap = true })

-- Επιστροφή στην λειτουργία επεξεργασίας (insert) ανάλογα με το περιβάλλον
if vim.fn.exists(':tnoremap') then
  vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
  vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n>', { noremap = true })
end

-- Σύντομοι χειρισμοί για τις αγκύλες, παρενθέσεις, και αγκύλες
vim.api.nvim_set_keymap('i', '{', '{}<LEFT>', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<ESC>i', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<LEFT>', { noremap = true })
vim.api.nvim_set_keymap('i', '{<Enter>', '{}<Left><CR><ESC><S-o>', { noremap = true })
vim.api.nvim_set_keymap('i', '(<Enter>', '()<Left><CR><ESC><S-o>', { noremap = true })
vim.api.nvim_set_keymap('i', '[<Enter>', '[]<Left><CR><ESC><S-o>', { noremap = true })

vim.api.nvim_set_keymap('i', '<C-a>', '<C-o>^', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-e>', '<C-o>$', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-f>', '<C-o>w', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-b>', '<C-o>b', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-d>', '<C-o>x', { noremap = true })

-- Επαναφορά της τελευταίας θέσης του κέρσορα
if vim.fn.has("autocmd") then
    vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*",
        callback = function()
            if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
                vim.fn.execute("normal! g'\"")
            end
        end
    })
end

-- term  που είναι "screen" ρύθμιση
if vim.o.term == "screen" then
    vim.opt.titlestring = "vim(" .. vim.fn.expand("%:t") .. ")"
    vim.opt.t_ts = "\27k"
    vim.opt.t_fs = "\27\\"
    vim.opt.title = true
end

-- Vim Ξεκινά όταν η καρτέλα ή το παράθυρο αλλάξει ή όταν διαβάζεται το αρχείο, BufNewFile
-- Set titlestring on VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = [[lua vim.cmd('let &titlestring = "vim(" . expand("%:t") . ")"')]]
})

-- Set titlestring on TabEnter
vim.api.nvim_create_autocmd("TabEnter", {
  pattern = "*",
  command = [[lua vim.cmd('let &titlestring = "vim(" . expand("%:t") . ")"')]]
})

-- Set titlestring on WinEnter
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  command = [[lua vim.cmd('let &titlestring = "vim(" . expand("%:t") . ")"')]]
})

-- Set titlestring on BufReadPost
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  command = [[lua vim.cmd('let &titlestring = "vim(" . expand("%:t") . ")"')]]
})

-- Set titlestring on FileReadPost
vim.api.nvim_create_autocmd("FileReadPost", {
  pattern = "*",
  command = [[lua vim.cmd('let &titlestring = "vim(" . expand("%:t") . ")"')]]
})

-- Set titlestring on BufNewFile
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  command = [[lua vim.cmd('let &titlestring = "vim(" . expand("%:t") . ")"')]]
})

-- Αναγνώριση αρχείων PHP και JavaScript
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.php",
  command = "lua vim.api.nvim_buf_set_option(0, 'filetype', 'php')"
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.php",
  command = "lua vim.api.nvim_buf_set_option(0, 'filetype', 'php')"
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.js",
  command = "lua vim.api.nvim_buf_set_option(0, 'filetype', 'javascript')"
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.js",
  command = "lua vim.api.nvim_buf_set_option(0, 'filetype', 'javascript')"
})


vim.opt.lazyredraw = true -- スクロール速度
vim.opt.ttyfast = true -- TTY ファースト
vim.opt.foldenable = false -- 折りたたみを無効化
vim.opt.tabstop = 2 -- 読み込み時の <TAB> サイズ
vim.opt.softtabstop = 2 -- 入力時の <TAB> サイズ
vim.opt.shiftwidth = 2 -- 自動インデントサイズ
-- vim.opt.expandtab = true -- タブを空白に変換
vim.opt.autoindent = true -- インデントを自動で補完
vim.opt.smartindent = true -- 末尾に応じてインデントの増減
vim.opt.smarttab = true -- 行頭余白内で <TAB> を打ち込むと 'shiftwidth' の数だけインデント
vim.opt.list = false -- 不可視文字
vim.opt.number = true -- 行番号を表示
vim.opt.ruler = true -- カーソル位置を表示
vim.opt.cursorline = true -- 現在行をハイライト
vim.opt.background = "dark" -- 背景を暗く
vim.opt.showmatch = true -- 対応する括弧を表示
vim.opt.matchtime = 1 -- 対応する括弧のハイライト時間
vim.opt.whichwrap = "b,s,h,l,<,>,[,]" -- カーソルが画面外にある場合のスクロール
vim.opt.ambiwidth = "single" -- 特殊記号が崩れないように（iTerm2 のため）
--vim.opt.display = vim.opt.display .. "lastline" -- 最後の行を表示
vim.opt.display = vim.opt.display + 'lastline'
--[[
if vim.bo.filetype ~= 'man' or vim.bo.filetype ~= 'help' then
    vim.opt.colorcolumn = "100" -- ファイルタイプが 'man' または 'help' でない場合のみカラム表示"
end
]]

vim.opt.cmdheight = 1 -- ステータスライン関連
vim.opt.laststatus = 2
vim.o.statusline = "[%n]"
vim.o.statusline = vim.o.statusline .. "=%<%F\\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P"
vim.o.notitle = true
vim.o.nowildmenu = true
vim.o.wildmode = "longest,list"
vim.o.wildignore = "*.o,*.obj,*.pyc,*.so,*.dll"
vim.o.showcmd = true
vim.o.browsedir = "buffer"

vim.api.nvim_command("sign define dummy")
vim.api.nvim_command("execute 'sign place 9999 line=1 name=dummy buffer=' .. bufnr('')")
--[[
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
    vim.api.nvim_command("highlight Structure ctermfg=205 guifg=#008800")
		vim.api.nvim_command("highlight NormalNC ctermfg=251 ctermbg=17 guifg=#a0a0a0 guibg=#121212")
	end
})
]]

--[[
vim.api.nvim_create_autocmd("WinEnter", {
	pattern = "*",
	callback = function()
    vim.api.nvim_win_set_option(0, "wincolor", "")
	end
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
    vim.api.nvim_win_set_option(0, "wincolor", "")
	end
})
vim.api.nvim_create_autocmd("WinLeave", {
	pattern = "*",
	callback = function()
		vim.api.nvim_win_set_option(0, "wincolor", "NormalNC")
	end
})
]]

vim.opt.vb = true -- ビジュアルベルの設定
vim.opt.mouse = ""
--vim.o.t_vb = ""
--vim.o.guicursor = ""
--vim.o.t_Co = 256
--vim.o.t_ut = ""
vim.o.synmaxcol = 240
vim.o.synmaxline = 200
vim.o.synchronize = true
vim.o.synmaxcol = 300
vim.o.synmaxline = 300
vim.o.updatetime = 100
vim.o.redrawtime = 1000
vim.cmd([[syn sync minlines=100]])
vim.cmd([[set redrawtime=10000]])

-- Plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-fugitive",
	"tpope/vim-repeat",
	"nvim-tree/nvim-web-devicons",
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = 'hard'
			vim.cmd([[colorscheme everforest]])
		end,
	},
	{
		'romgrk/barbar.nvim',
		dependencies = {'nvim-web-devicons'},
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-web-devicons', opt = true },
		options = { theme = 'everforest' },
		config = 'require("lualine").setup()'
	},
})

