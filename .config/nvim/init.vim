" ~/.config/nvim/init.vim

" PLUGINS --------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'

Plug 'jiangmiao/auto-pairs' "For autopairs on () {} [] quotes
Plug 'scrooloose/nerdcommenter' "<leader>cc comment <leader>cu uncomment
" Plug 'karb94/neoscroll.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" --------- themes ----------
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'

Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

" START NOTES -------------
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" Control+W followed by H/J/K/L to move to the left/bottom/top/right window accordingly
" Control+W followed by Left/Down/Up/Right arrow to move to the left/bottom/top/right window accordingly.
" END NOTES ------------

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
" colorscheme
syntax on
colorscheme codedark
set termguicolors
" highlight Normal ctermbg=NONE guibg=NONE
let g:airline_theme = 'codedark'

" START BARBAR ------------
" Move to previous/next
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
nnoremap <silent>    <A-w> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
" nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>
" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
" END BARBAR -------------

" START COC CONFIG --------
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
nnoremap <F12> :call CocActionAsync('jumpDefinition')<CR>
" nmap <F8> :TagbarToggle<CR>
" END COC CONFIG --------

" START AIRLINE CONFIG --------
" let g:airline_theme='wombat'
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
" END AIRLINE CONFIG ----------------

"remaps --------------
let mapleader = "," " map leader to comma

" exit edit mode
inoremap <leader>e <ESC>

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
" end remaps

" Telescope
nnoremap <leader>t :Telescope<CR>
"nnoremap <leader>tf <cmd>Telescope find_files<CR>
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <leader>tg <cmd>Telescope live_grep<CR>
nnoremap <leader>tb <cmd>Telescope buffers<CR>
nnoremap <leader>th <cmd>Telescope help_tags<CR>

" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFocus<CR>
"nnoremap <C-p> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
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

"lua << EOF
"	require('init')
"EOF
"require('gitsigns').setup()

