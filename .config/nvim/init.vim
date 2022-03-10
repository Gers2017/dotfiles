" ~/.config/nvim/init.vim

" PLUGINS --------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

Plug 'nvim-telescope/telescope.nvim'
Plug 'jiangmiao/auto-pairs' "For autopairs on () {} [] quotes
Plug 'scrooloose/nerdcommenter' "<leader>cc comment <leader>cu uncomment
Plug 'karb94/neoscroll.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" --------- themes ----------
Plug 'morhetz/gruvbox'
"Plug 'Mofiqul/dracula.nvim'
"Plug 'olimorris/onedarkpro.nvim'

Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'airblade/vim-gitgutter'

call plug#end()

" Control+W followed by H/J/K/L to move to the left/bottom/top/right window accordingly
" Control+W followed by Left/Down/Up/Right arrow to move to the left/bottom/top/right window accordingly.

set timeoutlen=1200 "Time in milliseconds to wait for a mapped sequence to complete.
set encoding=UTF-8
set title
set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect
set hidden
set inccommand=split
set splitbelow splitright  
set nohlsearch
set noerrorbells
set incsearch
set scrolloff=10
" viewport
set signcolumn=yes
set colorcolumn=80
" numbers
set number
set relativenumber
" tabs
set mouse=a
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set autoindent
set smartindent
set shortmess+=c
set completeopt-=preview " For No Previews

syntax on
colorscheme gruvbox
set termguicolors
highlight Normal ctermbg=NONE guibg=NONE

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" coc config
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" airline configs
let g:airline_theme='wombat'
let g:airline_powerline_fonts= 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#formatter='unique_tail_improved'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


"remaps :::::
let mapleader = "," " map leader to comma

" exit edit mode
inoremap <leader>e <ESC>

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" personal remaps
" copy the whole line
nnoremap Y Vy
" change inner word
nnoremap cw ciw
" yank inner word
nnoremap yw yiw
"delete inner word
nnoremap dw diw

" inner parens
nnoremap yb yib
nnoremap db dib
nnoremap cb cib

" inner curly brackets
nnoremap yB yiB
nnoremap dB diB
nnoremap cB ciB

" keep cursor centered while joining lines
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"undo breakpoints
inoremap , ,<c-g>u
inoremap ; ;<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

"move lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Tabs remaps
"nnoremap <leader>bn :bnext<CR>
"noremap <leader>bp :bprevious<CR>
"nnoremap <leader>bd :bdelete<CR>

nnoremap <leader><Right> :bnext<CR>
noremap  <leader><Left> :bprevious<CR>
nnoremap <leader>w :bdelete<CR>

" Telescope
nnoremap <leader>t :Telescope<CR>
nnoremap <leader>tf <cmd>Telescope find_files<CR>
nnoremap <leader>tg <cmd>Telescope live_grep<CR>
nnoremap <leader>tb <cmd>Telescope buffers<CR>
nnoremap <leader>th <cmd>Telescope help_tags<CR>

" NERDTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-p> :NERDTreeFind<CR>

nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

lua << EOF
	require('init')
	require('gitsigns').setup()
EOF

