call plug#begin('~/.local/share/nvim/plugged')
" function
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" customize
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'theniceboy/vim-deus'
Plug 'adrian5/oceanic-next-vim'
Plug 'glepnir/oceanic-material'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'hoob3rt/lualine.nvim'
Plug 'mhinz/vim-startify' "startify
Plug 'romgrk/barbar.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kyoz/purify', { 'rtp': 'vim' }


call plug#end()

set ts=4
set sw=4

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme purify 
let g:mapleader="`"

" ===
" === rainbow
" ===
"let g:rainbow_active = 1

" prettier
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <C-e> :CocCommand explorer<CR>
nnoremap <F8> :Vista!! <CR>

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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
EOF


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
lua <<EOF
require('lualine').setup{
options = {
	icons_enabled = true,
	theme = 'onedark'
				 }

	}
EOF

	"theme = 'everforest'

" Find files using Telescope command-line sugar.
nnoremap <c-f> <cmd>Telescope find_files<cr>
nnoremap <c-g> <cmd>Telescope live_grep<cr>
nnoremap <c-b> <cmd>Telescope buffers<cr>
nnoremap <c-h> <cmd>Telescope help_tags<cr>

nmap <space> :

filetype on
filetype plugin on
set termguicolors
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
"set signcolumn="yes"


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


" ==
" == vim-indent-guide
" ==
let g:indent_guides_enable_on_vim_startup = 2
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey



inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

let g:coc_global_extensions = [
			\ 'coc-actions',
			\ 'coc-diagnostic',
			\ 'coc-tsserver',
			\ 'coc-eslint',
			\ 'coc-explorer',
			\ 'coc-gitignore',
			\ 'coc-pairs',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-lists',
			\ 'coc-prettier',
			\ 'coc-pyright',
			\ 'coc-snippets',
			\ 'coc-translator',
			\ 'coc-vimlsp',
			\ 'coc-yaml',
			\ 'coc-java',
			\ 'coc-go',
			\ 'coc-css',
			\ 'coc-snippets',
			\ 'coc-ccls',
			\ 'coc-cmake',
			\ 'coc-import-cost',
			\ 'coc-yank']

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
