"
" vim-plug
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ciaranm/detectindent'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'mfukar/robotframework-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

call plug#end()

"
" Anything else
"
syntax on
filetype plugin indent on

set binary
set clipboard=unnamed
set colorcolumn=81,121
set expandtab
set hlsearch
set list
set listchars=tab:──,trail:·,extends:>,precedes:<
set modeline
set modelines=5
set mouse=a
set nocompatible
set number
set shiftwidth=2
set tabstop=2
set tags=tags;/

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load external .vimrc (project specific) and prevent malicious commands
set exrc
set secure

" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ignore whitespace for git-gutter
let g:gitgutter_diff_args = '-w'

" goimports on .go save
let g:go_fmt_command = "goimports"
