call plug#begin('~/.vim/plugged')
  Plug 'vhda/verilog_systemverilog.vim'
call plug#end()
set background=dark
set expandtab
set visualbell
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
colors koehler
if has("autocmd") 
  filetype plugin indent on 
endif
set bs=2
