execute pathogen#infect()
call plug#begin('~/.vim/plugged')
Plug 'vhda/verilog_systemverilog.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'paranoida/vim-airlineish/'
Plug 'wesQ3/vim-windowswap'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Konfekt/FastFold'
Plug 'vimtaku/hl_matchit.vim'
Plug 'jreybert/vimagit'
Plug 'majutsushi/tagbar' 
Plug 'scrooloose/nerdcommenter'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'nanotech/jellybeans.vim'
Plug 'miyakogi/seiya.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'craigemery/vim-autotag'
" Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'fatih/vim-go' 
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'liuchengxu/space-vim-dark'
Plug 'christophermca/meta5'
Plug 'cseelus/vim-colors-lucid'
Plug 'rking/ag.vim'
Plug 'NLKNguyen/copy-cut-paste.vim'
call plug#end()

set exrc
set secure

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

if !has('nvim')
set ttymouse=xterm2
endif

if has('nvim')
  :tnoremap <C-w> <C-\><C-n><C-w>
  :tnoremap <C-h> <C-\><C-n><C-w>h
  :tnoremap <C-j> <C-\><C-n><C-w>j
  :tnoremap <C-k> <C-\><C-n><C-w>k
  :tnoremap <C-l> <C-\><C-n><C-w>l
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert 
endif 

set t_vb=
let g:SuperTabDefaultCompletionType = 'context'
runtime macros/matchit.vim
let g:airline_theme='airlineish'

let g:ctrlp_extensions = ['buffertag']

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
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
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_verilog_checkers = ['iverilog']
let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_tex_chktex_quiet_messages = { "type": "style" }

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>
set splitbelow
set splitright

"Leader+l = toggle highlighting
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
":setlocal spell spelllang=en_us


let g:NERDSpaceDelims = 1
let g:NERDAltDelims_c = 1
let g:NERDTrimTrailingWhitespace = 1

" Note this is actually ctrl-/.
map <C-_> <plug>NERDCommenterToggle

" TMUX stuff
let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" set background=dark
set termguicolors
colorscheme space-vim-dark

"Transparent Background in term
" hi Normal ctermbg=NONE
" hi NonText ctermbg=none
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

let g:Tex_CompileRule_pdf = 'pdflatex $*'
augroup vimrc
    au!
    au VimEnter * unmap <C-j>
    au VimEnter * noremap <C-j> <C-w>j
augroup END

" Allow for uppercase w and q
:command WQ wq
:command Wq wq
:command W w
:command Q q
cnoreabbrev ag Ag

" 333 HW3 Hex Tools!
" Use :Hex to hexdump a file
" Use :GoHex 0001 010f to go to file position 0x1010f
command! Hex %!xxd

function! GoToHex(p)
 let p = substitute(a:p, ' ', '', 'g')
 if strlen(p) == 5
  let p = p[1:]
 endif
 echo p
 let pos = str2nr(p, 16)
 let line_num = pos / 16
 let line_pos = pos % 16
 let line_offset = 10 + 2 * (line_pos % 2) + 5 * (line_pos / 2)
 exe 'goto' (line_num * 68 + line_offset)
 return ""
endfunction

command! -nargs=1 GoHex call GoToHex(<f-args>)

" automatically hexdump on .idx files
autocmd BufReadPost *.idx :silent Hex

map <C-\> :NERDTreeToggle<CR>

map <C-S-o> :TagbarOpen fj<CR>
map <C-A-o> :TagbarToggle<CR>
let g:autotagTagsFile=".tags"
set tags=.tags;
set colorcolumn=80

" Pressing F10 will take you to corresponding position if it's representable for
" numbers up to 0xffff! (Assumes it is a position)
" map <F10> :execute "GoHex /" . expand("<cword>") <CR>

" Automatically open nerdtree if vim is opened without any files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
