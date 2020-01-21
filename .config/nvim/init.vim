call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'paranoida/vim-airlineish/'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar' 
Plug 'scrooloose/nerdcommenter'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'liuchengxu/space-vim-dark'
Plug 'dylanaraps/wal.vim'
Plug 'rking/ag.vim'
Plug 'NLKNguyen/copy-cut-paste.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neomake/neomake'
call plug#end()

" Write automatically when calling make
set autowrite

" use Ctrl-N and Ctrl-M to jump between errors
" use \-c to close the quickfix window
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

set encoding=utf-8
set expandtab
set visualbell
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

if has("autocmd")
filetype plugin indent on
endif
set bs=2
set ttyfast
set mouse=a

if has('nvim')
  :tnoremap <C-w> <C-\><C-n><C-w>
  :tnoremap <C-h> <C-\><C-n><C-w>h
  :tnoremap <C-j> <C-\><C-n><C-w>j
  :tnoremap <C-k> <C-\><C-n><C-w>k
  :tnoremap <C-l> <C-\><C-n><C-w>l
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert 
endif 

let g:SuperTabDefaultCompletionType = 'context'
let g:airline_theme='airlineish'

let g:ctrlp_extensions = ['buffertag']

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

map <c-w>] :vertical stag <c-r>=expand("<cword>")<cr><cr>

nnoremap <silent> <NUL> :CtrlPBufTagAll<CR>

"Trailing White space highlighting + removal
nnoremap <silent> <F4> :match ExtraWhitespace /\s\+\%#\@<!$/<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
set statusline+=%#warningmsg#
set statusline+=%*

"Leader+l = toggle highlighting
set hlsearch
let hlstate=0
nnoremap <silent> <leader>l :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>
"next and previous buffers with tab
nnoremap <silent> <leader><tab> :bn<cr>
nnoremap <silent> <S-tab> :bp<cr>

" This fixes vim lag with airline enables
set ttimeoutlen=1

set pastetoggle=<leader>z "Paste mode

"Tab with shift+directio
nnoremap <S-l> gt
noremap <S-h> gT

"Align paragraph block
noremap <leader>a =ip

"Ctrl+direction change panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j // This is remapped at the bottom thanks to vim-latex
noremap <C-k> <C-w>k

"relative numbering. One of the plugins imrpoves on ths
set number rnu
:setlocal spell spelllang=en_us

" Note this is actually ctrl-/.
map <C-_> <plug>NERDCommenterToggle

set background=dark
" set termguicolors
" colorscheme space-vim-dark
colorscheme wal
set t_Co=256

"Transparent Background in term
" hi Normal ctermbg=NONE
" hi NonText ctermbg=none

let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'


map <C-\> :NERDTreeToggle<CR>
let NERDTreeSortOrder=['/$','\.c$','\.h$','\.asm$','\.S$','\.py$']
let NERDTreeIgnore=['\.pyc$','\.o$',]
let NERDTreeQuitOnOpen = 1

" Automatically open nerdtree if vim is opened without any files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDSpaceDelims = 1
let g:NERDAltDelims_c = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "⚡",
    \ "Staged"    : "+",
    \ "Untracked" : "$",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "x",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✓",
    \ "Ignored"   : "&",
    \ "Unknown"   : "?"
    \ }


" Allow for uppercase :W and :Q
:command WQ wq
:command Wq wq
:command W w
:command Q q
cnoreabbrev ag Ag
cnoreabbrev agc Ag --cc

map <c-S-o> :TagbarOpen fj<CR>
map <c-A-o> :TagbarToggle<CR>
set colorcolumn=80

" Pressing F10 will take you to corresponding position if it's representable for
" numbers up to 0xffff! (Assumes it is a position)
" map <F10> :execute "GoHex /" . expand("<cword>") <CR>

let g:easytags_async = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" call neomake when writing a buffer (no delay).
call neomake#configure#automake('w')
let g:neomake_error_sign = {
   \ 'text': '✗',
   \ 'texthl': 'NeomakeErrorSign',
   \ }
let g:neomake_warning_sign = {
   \   'text': '‼',
   \   'texthl': 'NeomakeWarningSign',
   \ }
let g:neomake_message_sign = {
    \   'text': '➤',
    \   'texthl': 'NeomakeMessageSign',
    \ }
let g:neomake_info_sign = {
    \ 'text': 'i',
    \ 'texthl': 'NeomakeInfoSign'
    \ }
