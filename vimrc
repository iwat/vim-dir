syntax on
filetype plugin indent on

set backspace=indent,eol,start
set binary
set clipboard=unnamed
set colorcolumn=81,121
set expandtab
set modeline
set modelines=5
set mouse=a
set number
set ruler
set shiftwidth=4
set tabstop=4
set tags=tags;/

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

execute pathogen#infect()

" Load external .vimrc (project specific) and prevent malicious commands
set exrc
set secure
