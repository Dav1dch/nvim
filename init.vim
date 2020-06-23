call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'ctrlpvim/ctrlp/vim' "fuzzy find file"
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'
Plug 'theniceboy/vim-deus'
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

set syntax=on
set autoindent
set nu
filetype on
filetype plugin on
set showcmd
set laststatus=2
set cindent
set tabstop=4
set matchtime=1
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set cursorline
set relativenumber
set clipboard=unnamedplus
set autochdir
set cinoptions=g0,:0,N-s.(0)
set smartindent

set expandtab
set smarttab

" search
set wildmenu 
" set incsearch
set ignorecase

" cache
set nobackup
set noswapfile
set autoread
set autowrite
syntax enable
" dress up vim
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color deus
" colorscheme dracula

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()


"NERDTree shotcut
nmap <F2> :NERDTree <CR>
let g:NERDTreeWinSize=30
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1
