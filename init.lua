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

local has
has = function(arg)
	return vim.fn.has(arg) == 1
end
-- basic.vim
local is_win = has('win32') or has('win64')
local is_mac = has('mac') or has('macunix')
local is_vscode = vim.g.vscode == 1

vim.opt.ignorecase = true -- Αγνόηση πεζών/κεφαλαίων κατά την αναζήτηση
vim.opt.smartcase = true  -- Έξυπνη αναζήτηση: χρησιμοποίησε πεζούς/κεφαλαίους αν υπάρχουν στο αναζητούμενο
vim.opt.hlsearch = true   -- Υψηλή φωτεινότητα για το κείμενο κατά την αναζήτηση
vim.opt.incsearch = true  -- Έναρξη αναζήτησης με τον πρώτο χαρακτήρα της λέξης
vim.opt.swapfile = false  -- Απενεργοποίηση δημιουργίας αρχείων ανταλλαγής
vim.opt.backup = false    -- Απενεργοποίηση δημιουργίας αρχείων αντιγραφής ασφαλείας
vim.opt.hidden = true     -- Κρυφό buffer: δυνατότητα αλλαγής buffer χωρίς αποθήκευση
vim.opt.autoread = true   -- Αυτόματη ανάγνωση αρχείου όταν αυτό αλλάξει από άλλη πηγή

-- Απενεργοποίηση της λειτουργίας paste mode όταν βγαίνουμε από την κατάσταση Insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste"
})

vim.g.markdown_fenced_languages = {
	"ts=typescript",
	"js=javascript",
}

-- keymaps.vim
vim.api.nvim_set_keymap('n', ',', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ","      -- Ορισμός του leader ως κόμμα
vim.g.maplocalleader = "," -- Ορισμός του leader ως κόμμα

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
vim.api.nvim_set_keymap('n', '<Space>t', ':tabnew ', { noremap = true })

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
	vim.opt.termguicolors = true
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


-- vim.opt.lazyredraw = true             -- スクロール速度
vim.opt.ttyfast = true                -- TTY ファースト
vim.opt.foldenable = false            -- 折りたたみを無効化
vim.opt.tabstop = 2                   -- 読み込み時の <TAB> サイズ
vim.opt.softtabstop = 2               -- 入力時の <TAB> サイズ
vim.opt.shiftwidth = 2                -- 自動インデントサイズ
-- vim.opt.expandtab = true -- タブを空白に変換
vim.opt.autoindent = true             -- インデントを自動で補完
vim.opt.smartindent = true            -- 末尾に応じてインデントの増減
vim.opt.smarttab = true               -- 行頭余白内で <TAB> を打ち込むと 'shiftwidth' の数だけインデント
vim.opt.list = false                  -- 不可視文字
vim.opt.number = true                 -- 行番号を表示
vim.opt.relativenumber = true         -- 行番号を表示
vim.opt.signcolumn = 'yes'
vim.opt.ruler = true                  -- カーソル位置を表示
vim.opt.cursorline = true             -- 現在行をハイライト
vim.opt.background = "dark"           -- 背景を暗く
vim.opt.showmatch = true              -- 対応する括弧を表示
vim.opt.matchtime = 1                 -- 対応する括弧のハイライト時間
vim.opt.whichwrap = "b,s,h,l,<,>,[,]" -- カーソルが画面外にある場合のスクロール
vim.opt.ambiwidth = "single"          -- 特殊記号が崩れないように（iTerm2 のため）
--vim.opt.display = vim.opt.display .. "lastline" -- 最後の行を表示
vim.opt.display = vim.opt.display + 'lastline'
--[[
if vim.bo.filetype ~= 'man' or vim.bo.filetype ~= 'help' then
    vim.opt.colorcolumn = "100" -- ファイルタイプが 'man' または 'help' でない場合のみカラム表示"
end
]]

vim.opt.cmdheight = 1 -- ステータスライン関連
vim.opt.laststatus = 3
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

local merge_tables
merge_tables = function(t1, t2)
	local merged = {}
	for _, v in ipairs(t1) do
		table.insert(merged, v)
	end
	for _, v in ipairs(t2) do
		table.insert(merged, v)
	end
	return merged
end

local common_plugins, vscode_plugins, neovim_plugins
common_plugins = {
	{
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function()
			local hop = require('hop')
			hop.setup { keys = 'etovxqpdygfblzhckisuran' }
			vim.keymap.set('n', 'zw', ':HopWord<CR>', { silent = true })
			vim.keymap.set('n', 'zl', ':HopLine<CR>', { silent = true })
			vim.keymap.set('n', 'zz', ':HopChar1<CR>', { silent = true })
			vim.keymap.set('n', 'zx', ':HopChar2<CR>', { silent = true })
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}

vscode_plugins = {

}

neovim_plugins = {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.cmd([[command! GG Git blame]])
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
		},
		config = function()
			local builtin = require('telescope.builtin')
			--vim.keymap.set('n', '<Space>ff', builtin.find_files, {})
			--vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
			vim.api.nvim_set_keymap('n', '<Space>ff',
				[[<Cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<CR>]],
				{ noremap = true, silent = true })
			--vim.api.nvim_set_keymap('n', '<Space>fg', [[<Cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('%:p:h') })<CR>]], { noremap = true, silent = true })
			vim.keymap.set('n', '<Space>fb', builtin.buffers, {})
			vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
		end,
	},
	"tpope/vim-repeat",
	"nvim-tree/nvim-web-devicons",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			'folke/neodev.nvim',
		},
		config = function()
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
					vim.lsp.with(
						vim.lsp.diagnostic.on_publish_diagnostics,
						{
							virtual_text = false,
						}
					)
			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = 'LSP: ' .. desc
					end

					vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
				end

				nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

				nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
				nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
				nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
				nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

				-- See `:help K` for why this keymap
				nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
				nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

				-- Lesser used LSP functionality
				nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
				nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
				nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
				nmap('<leader>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, '[W]orkspace [L]ist Folders')

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
					vim.lsp.buf.format()
				end, { desc = 'Format current buffer with LSP' })
			end

			require('neodev').setup()

			local servers = {
			}

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			-- Ensure the servers above are installed
			local mason_lspconfig = require 'mason-lspconfig'

			mason_lspconfig.setup {
				ensure_installed = vim.tbl_keys(servers),
			}

			mason_lspconfig.setup_handlers {
				function(server_name)
					require('lspconfig')[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					}
				end
			}
		end
	},
	'ap/vim-css-color',
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup {
				stages = 'slide',
				timeout = 3000,
			}
			vim.notify = require('notify')
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-omni' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
		},
		config = function()
			local cmp = require 'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
							--elseif luasnip.expand_or_jumpable() then
							--	luasnip.expand_or_jump()
							--elseif has_words_before() then
							--	cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
							--elseif luasnip.jumpable(-1) then
							--	luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
					['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
					['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					['<C-y>'] = cmp.config.disable,
					['<C-e>'] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					-- { name = 'vsnip' }, -- For vsnip users.
					-- { name = 'luasnip' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = 'buffer' },
				})
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = 'buffer' },
				})
			})

			cmp.setup.filetype({ 'javascript' }, {
				source = cmp.config.sources({
					{
						name = 'denols',
					}
				})
			});

			cmp.setup.filetype({ 'php' }, {
				sources = cmp.config.sources({
					{
						name = 'omni',
						keyword_length = 4,
					}
				}, {
					{ name = 'buffer' },
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})

			-- Set up lspconfig.
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
		end,
	},
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', 'g[', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
				vim.keymap.set('n', 'g]', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
				--vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
			end,
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup {
				ensure_installed = {
					"vimdoc", "vim", "dockerfile", "fish", "typescript", "tsx", "javascript", "json", "lua", "gitignore", "bash", "astro", "markdown", "css", "scss", "yaml", "toml", "vue", "php", "html",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					disable = {},
				},
				indent = {
					enable = true,
					disable = { "html" },
				},
				autotag = {
					enable = true,
				},
			}
		end,
	},
	{
		'akinsho/bufferline.nvim',
		version = '*',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			config = 'require("bufferline").setup{}'
		},
	},
	'mhartington/oceanic-next',
	'hiphish/rainbow-delimiters.nvim',
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.g.everforest_background = 'hard'
			--vim.cmd([[colorscheme everforest]])
		end,
	},
	{
		"sainnhe/edge",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.edge_style = 'aura'
			vim.g.edge_better_performance = 1
			vim.cmd([[colorscheme edge]])
		end,
	},
	{
		"sainnhe/sonokai",
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			{ 'nvim-web-devicons',                 opt = true },
			{ 'Isrothy/lualine-diagnostic-message' },
		},
		options = {
			theme = 'everforest',
		},
		config = function()
			require("lualine").setup {
				sections = {
					lualine_c = {
						"diagnostic-message",
					}
				}
			}
		end,
	},
	{
		'stevearc/aerial.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("aerial").setup({
				layout = {
					placement = "edge",
				},
				backends = { "lsp", "treesitter" },
				highlight_on_hover = false,
				filter_kind = {
					"Class",
					"Constructor",
					"Enum",
					"Function",
					"Interface",
					"Module",
					"Method",
					"Struct",
				},
				nerd_font = "auto",
				-- optionally use on_attach to set keymaps when aerial has attached to a buffer
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
			-- You probably also want to set a keymap to toggle aerial
			vim.keymap.set("n", "<Space>a", "<cmd>AerialToggle!<CR>")
		end,
	},
	{
		"mvllow/stand.nvim",
		config = function()
			require("stand").setup({
				minute_interval = 60,
			})
		end,
	},
}


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

require("lazy").setup(
	merge_tables(common_plugins, is_vscode and vscode_plugins or neovim_plugins)
)
