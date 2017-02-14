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

let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='breezy'

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
nmap <F8> :TagbarToggle<CR>
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
let g:windowswap_map_keys = 0 "prevent default bindings
let g:syntastic_verilog_checkers = ['iverilog']
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>
set splitbelow
set splitright
set hlsearch
" This fixes vim lag with airline enables
set ttimeoutlen=1
" This fixes lag with verilog folding
let g:verilog_systemverilog_fold = 1
