execute pathogen#infect()
call plug#begin('~/.vim/plugged')
Plug 'vhda/verilog_systemverilog.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ervandew/supertab'
Plug 'fneu/breezy'
Plug 'broduo/broduo-color-scheme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wesQ3/vim-windowswap'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Konfekt/FastFold'
Plug 'vimtaku/hl_matchit.vim'
Plug 'jreybert/vimagit'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-scripts/Conque-GDB'
call plug#end()
set background=dark
set expandtab
set visualbell
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
if has("autocmd")
filetype plugin indent on
endif
set bs=2
set ttyfast
set mouse=a
set ttymouse=xterm
let g:SuperTabDefaultCompletionType = 'context'
runtime macros/matchit.vim

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
let g:airline_theme='breezy'

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
nmap <F8> :TagbarToggle<CR>

"Trailing White space highlighting + removal
nnoremap <silent> <F4> :match ExtraWhitespace /\s\+\%#\@<!$/
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
colorscheme breezy
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_verilog_checkers = ['iverilog']

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>
set splitbelow
set splitright

"Leader+hl = toggle highlighting
set hlsearch
let hlstate=0
nnoremap <silent> <leader>l :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>
"next and previous buffers with tab
nnoremap <silent> <leader><tab> :bn<cr>
nnoremap <silent> <S-tab> :bp<cr>

" This fixes vim lag with airline enables
set ttimeoutlen=1
" This fixes lag with verilog folding
let g:verilog_systemverilog_fold = 1
"clone paragraph with cp
noremap cp yap<S-}>p
set pastetoggle=<leader>z "Paste mode
"Playback macro with Q. record with qq and stop with q.
nnoremap Q @q 
vnoremap Q :norm @q<cr>
"Tab with shift+directio
nnoremap <S-l> gt 
noremap <S-h> gT 
"Align paragraph block
noremap <leader>a =ip
"Ctrl+direction change panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"relative numbering. One of the plugins imrpoves on ths
set rnu
