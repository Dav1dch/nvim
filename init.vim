call plug#begin('~/.local/share/nvim/plugged')
Plug 'RRethy/vim-illuminate'
Plug 'steelsojka/pears.nvim'

" functions
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'liuchengxu/vista.vim'
Plug 'neovim/nvim-lspconfig'

Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'norcalli/snippets.nvim'
Plug 'folke/trouble.nvim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
"file
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'shaunsingh/nord.nvim'
Plug 'mhinz/vim-startify' "startify
Plug 'ctrlpvim/ctrlp.vim' "fuzzy find file"
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter'
Plug 'theniceboy/vim-deus'
Plug 'hoob3rt/lualine.nvim'
Plug 'luochen1990/rainbow'
Plug 'glepnir/lspsaga.nvim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'chiel92/vim-autoformat'
"Plug 'ajmwagar/vim-deus'
call plug#end()


" prettier
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <C-e> :NERDTreeToggle<CR>
au BufWrite * :Autoformat
nmap <space> :

filetype on
filetype plugin on
set syntax=on
set autoindent
set hidden
set nu
set encoding=utf-8
set showcmd
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=8
set matchtime=1
set list
set listchars=tab:▎\ ,trail:▫
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set cursorline
set relativenumber
set clipboard=unnamedplus
set autochdir
set cinoptions=g0,:0,N-s.(0)
" set ttyfast
set signcolumn="yes"


" search
set wildmenu
set incsearch
set ignorecase

" cache
set nobackup
set noswapfile
set autoread
set autowrite
syntax enable



" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sh :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <c-up> :res +5<CR>
noremap <c-down> :res -5<CR>
noremap <c-left> :vertical resize-5<CR>
noremap <c-right> :vertical resize+5<CR>

lua << EOF
require("pears").setup()
EOF
lua <<EOF
require('lualine').setup{
options = {
	icons_enabled = true,
				\ theme = 'nord'
				\ }

	}
EOF

lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
lua << EOF
require("trouble").setup {}
EOF


lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup(
{
	completion = {
		completeopt = 'menu,menuone,noinsert',
		},
	snippet = {
		expand = function(args)
		-- For `vsnip` user.
		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

		-- For `luasnip` user.
		-- require('luasnip').lsp_expand(args.body)

		-- For `ultisnips` user.
		-- vim.fn["UltiSnips#Anon"](args.body)
	end,
	},
mapping = {
	['<C-k>'] = cmp.mapping.scroll_docs(-4),
	['<C-j>'] = cmp.mapping.scroll_docs(4),
	['<C-e>'] = cmp.mapping.close(),
	['<Tab>'] = cmp.mapping.confirm({
	behavior = cmp.ConfirmBehavior.Replace,
	select = true,
	}),
},
sources = {
	{ name = 'nvim_lsp' },

	-- For vsnip user.
	{ name = 'vsnip' },

	-- For luasnip user.
	-- { name = 'luasnip' },

	-- For ultisnips user.
	-- { name = 'ultisnips' },

	{ name = 'buffer' },
	}
})

require('lspconfig').clangd.setup{
capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require('lspconfig').bashls.setup{
capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require('lspconfig').cmake.setup{

capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
EOF

lua <<EOF
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
	require'lspconfig'[server].setup{}
end
EOF

"inoremap <silent><expr> <Tab>      compe#confirm('<CR>')

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cc lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.java lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>



lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
ignore_install = { "javascript" }, -- List of parsers to ignore installing
highlight = {
enable = true,              -- false will disable the whole extension
-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
-- Using this option may slow down your editor, and you may see some duplicate highlights.
-- Instead of true it can also be a list of languages
additional_vim_regex_highlighting = false,
},
}
EOF

nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

let g:python3_host_prog="/usr/bin/python3"

" ===
" === rainbow
" ===
let g:rainbow_active = 1

set termguicolors " enable true colors support
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:nord_disable_background =  v:true
let g:nord_enable_sidebar_background = v:true
let g:nord_italic = v:true
colorscheme deus

hi NonText ctermfg=gray guifg=grey10

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
"inoremap <silent><expr> <TAB>
			"\ pumvisible() ? "\<C-n>" :
			"\ <SID>check_back_space() ? "\<TAB>" :
			"\ coc#refresh()
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <c-o> coc#refresh()


" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
"let g:gitgutter_sign_added = ''
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'


" vim-buffer
"nnoremap <silent> <c-p> :bp<cr>
nnoremap <silent> bn :bn<cr>
nnoremap <silent> <a-TAB> :bn<cr>
"nnoremap <a-W> :bp|bd<cr>


let g:mapleader="`"

nnoremap <silent><leader>fa :Lspsaga code_action<CR>
vnoremap <silent><leader>fa :<C-U>Lspsaga range_code_action<CR>
" set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"if has("patch-8.1.1564")
"" Recently vim can merge signcolumn and number column into one
"set signcolumn=number
"else
"set signcolumn=yes
"endif
"" coc-translator
"nmap ts <Plug>(coc-translator-p)
"" Remap for do codeAction of selected region
"function! s:cocActionsOpenFromSelected(type) abort
"execute 'CocCommand actions.open ' . a:type
"endfunction
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>aw  <Plug>(coc-codeaction-selected)w


" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"vista.vim
"
"
nmap <F8> :Vista!!<CR>


function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
"let g:vista_executive_for = {
			"\ 'cpp': 'nvim_lsp',
			"\ 'php': 'nvim_lsp',
			"\ }
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
			\ 'haskell': 'hasktags -x -o - -c',
			\ }

" set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
				\   'left': [ [ 'mode', 'paste' ],
				\             [ 'readonly', 'filename', 'modified', 'method' ] ]
				\ },
				\ 'component_function': {
					\   'method': 'NearestMethodOrFunction'
					\ },
					\ }


" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
autocmd User TelescopePreviewerLoaded setlocal wrap
lua << EOF
require('telescope').setup{
defaults = {
	file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
	grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
	qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
	}
}
EOF
" Find files using Telescope command-line sugar.
nnoremap <c-f> <cmd>Telescope find_files<cr>
nnoremap <c-g> <cmd>Telescope live_grep<cr>
nnoremap <c-b> <cmd>Telescope buffers<cr>
nnoremap <c-h> <cmd>Telescope help_tags<cr>

" ===
" === CTRLP (Dependency for omnisharp)
" ===
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'

"" Useful commands
"nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <leader>rn <Plug>(coc-rename)
"nmap tt :CocCommand explorer<CR>

" ==
" == vim-indent-guide
" ==
let g:indent_guides_enable_on_vim_startup = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Compile function
noremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc



"let g:coc_global_extensions = [
			"\ 'coc-actions',
			"\ 'coc-diagnostic',
			"\ 'coc-tsserver',
			"\ 'coc-eslint',
			"\ 'coc-explorer',
			"\ 'coc-gitignore',
			"\ 'coc-pairs',
			"\ 'coc-html',
			"\ 'coc-json',
			"\ 'coc-lists',
			"\ 'coc-prettier',
			"\ 'coc-pyright',
			"\ 'coc-python',
			"\ 'coc-snippets',
			"\ 'coc-translator',
			"\ 'coc-vimlsp',
			"\ 'coc-yaml',
			"\ 'coc-java',
			"\ 'coc-go',
			"\ 'coc-css',
			"\ 'coc-cmake',
			"\ 'coc-import-cost',
			"\ 'coc-clangd',
			"\ 'coc-yank']

