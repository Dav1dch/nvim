call plug#begin('~/.local/share/nvim/plugged')
Plug 'RRethy/vim-illuminate'

" functions
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align

"file
Plug 'mhinz/vim-startify' "startify
Plug 'ctrlpvim/ctrlp.vim' "fuzzy find file"
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'psliwka/vim-smoothie'
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }

" dress up
" Treesitter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'airblade/vim-gitgutter'
Plug 'mg979/vim-xtabline'
Plug 'theniceboy/vim-deus'
Plug 'ryanoasis/vim-devicons'
Plug 'ojroques/vim-scrollstatus'
Plug 'theniceboy/eleline.vim'
Plug 'luochen1990/rainbow'
Plug 'bpietravalle/vim-bolt'
Plug 'bling/vim-bufferline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()

" prettier
	"command! -nargs=0 Prettier :CocCommand prettier.formatFile


filetype on
filetype plugin on
set syntax=on
set autoindent
set hidden
set nu
set encoding=utf-8
set showcmd
set laststatus=2
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=4
set matchtime=1
"set list
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
set ttyfast
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

" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tp :-tabnext<CR>
noremap tn :tabnext<CR>

" dress up vim
" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:Hexokinase_highlighters = ['backgroundfull']

" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
"let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['n']                  = 'k'
let g:VM_maps['N']                  = 'K'
let g:VM_maps['Find Under']         = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-s>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'
let g:VM_maps["Add Cursor Down"]               = '<c-j>'
let g:VM_maps["Add Cursor Up"]               = '<c-k>'


" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {typescript},     -- one of "all", "language", or a list of languages
	highlight = {
enable = true,              -- false will disable the whole extension
},
}
EOF

" ===
" === rainbow
" ===
let g:rainbow_active = 1

set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color deus
hi NonText ctermfg=gray guifg=grey10

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


let g:mapleader=" "
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

set statusline+=%{NearestMethodOrFunction()}

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


"NERDTree shotcut
nmap <F2> :NERDTreeToggle <CR>
let g:NERDTreeWinSize=30
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1
" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ 'Ignored'   : '☒',
			\ "Unknown"   : "?"
			\ }

" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
set rtp+=/home/david/.linuxbrew/opt/fzf
noremap <C-p> :Files<CR>
noremap <C-f> :Rg<CR>
noremap <C-h> :History<CR>
noremap <C-t> :BTags<CR>
noremap <C-l> :Lines<CR>
noremap <C-b> :Buffers<CR>
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
	redir => list
	silent ls
	redir END
	return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
	execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
			\ 'source': s:list_buffers(),
			\ 'sink*': { lines -> s:delete_buffers(lines) },
			\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
			\ }))

noremap <c-d> :BD<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" ===
" === CTRLP (Dependency for omnisharp)
" ===
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'

" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>

" ==
" == vim-multiple-cursor
" ==
"let g:multi_cursor_use_default_mapping = 0
"let g:multi_cursor_start_word_key = '<c-k>'
"let g:multi_cursor_select_all_word_key = '<a-k>'
"let g:multi_cursor_start_key = 'g<c-k>'
"let g:multi_cursor_select_all_key = 'g<a-k>'
"let g:multi_cursor_next_key = '<c-k>'
"let g:multi_cursor_prev_key = '<c-p>'
"let g:multi_cursor_skip_key = '<C-s>'
"let g:multi_cursor_quit_key = '<Esc>'

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
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		CocCommand flutter.dev.openDevLog
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

" change-colorscheme
nnoremap <silent> <F9> :PreviousColorScheme<cr>
inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
nnoremap <silent> <F10> :NextColorScheme<cr>
inoremap <silent> <F10> <esc> :NextColorScheme<cr>
nnoremap <silent> <F11> :RandomColorScheme<cr>
inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F12> :ShowColorScheme<cr>
inoremap <silent> <F12> <esc> :ShowColorScheme<cr>

" airline
" let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
"let g:airline_section_x = '%{ScrollStatus()}'
let g:airline#extensions#tabline#enabled = 1
"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''


let g:coc_global_extensions = [
			\ 'coc-diagnostic',
			\ 'coc-eslint',
			\ 'coc-explorer',
			\ 'coc-gitignore',
			\ 'coc-pairs',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-lists',
			\ 'coc-prettier',
			\ 'coc-pyright',
			\ 'coc-python',
			\ 'coc-snippets',
			\ 'coc-translator',
			\ 'coc-vimlsp',
			\ 'coc-yaml',
			\ 'coc-java',
			\ 'coc-go',
			\ 'coc-css',
			\ 'coc-cmake',
			\ 'coc-clangd',
			\ 'coc-yank']

