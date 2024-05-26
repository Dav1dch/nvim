-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

vim.scriptencoding = 'utf-8'
opt.number = true
opt.tabstop = 2
opt.encoding = 'utf-8'
-- opt.fileencoding = 'utf-8'
opt.scrolloff = 6
opt.sidescrolloff = 6
opt.hlsearch = true
opt.incsearch = true

opt.mouse = 'a'
opt.clipboard:append('unnamedplus')
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true
opt.pumheight = 15

opt.signcolumn = 'yes'
opt.list = true
opt.cursorline = true


opt.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

vim.o.ttyfast = true
vim.o.autochdir = true
vim.o.exrc = true
vim.o.secure = false
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.list = true
vim.o.listchars = 'tab:|\\ ,trail:▫'
vim.o.scrolloff = 4
vim.o.ttimeoutlen = 0
vim.o.timeout = false
vim.o.viewoptions = 'cursor,folds,slash,unix'
vim.o.wrap = true
vim.o.textwidth = 0
vim.o.indentexpr = ''
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.foldenable = false
vim.o.foldlevelstart = 99
vim.o.formatoptions = vim.o.formatoptions:gsub('tc', '')
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showmode = false
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.inccommand = 'split'
-- vim.o.completeopt = 'longest,noinsert,menuone,noselect,preview'
vim.o.completeopt = 'menuone,noinsert,noselect,preview'
vim.o.lazyredraw = true
-- -- vim.o.visualbell = true
-- vim.o.colorcolumn = '100'
vim.o.updatetime = 100
vim.o.virtualedit = 'block'

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })
-- vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "silent! lcd %:p:h", })
--
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
--



local signs = { Error = "⤫", Warn = " ", Hint = "💡", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.g.UltiSnipsSnippetDirectories = {
  "/Users/david/.config/snippets", "UltiSnips"
}
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader><CR>", ":luafile /Users/david/.config/nvim/init.lua<CR>", opts)
vim.g.python3_host_prog = '/home/david/anaconda3/envs/dl/bin/python'
-- vim.opt.guicursor = "n:hor100,i:ver25"

vim.cmd([[colorscheme nord]])
vim.cmd([[:highlight MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#343456 ]])
vim.cmd([[:highlight minimapRange ctermfg=white guifg=#ffffff guibg=#343456]])
vim.g.minimap_cursor_color = 'MinimapCurrentLine'



-- vim.cmd [[:highlight CursorLine guibg=#112233]]

-- vim.cmd [[:highlight Cursor gui=NONE guifg=bg guibg=fg]]
-- vim.cmd [[:highlight normal guibg=NONE]]
-- :highlight Cursor gui=NONE guifg=bg guibg=fg
