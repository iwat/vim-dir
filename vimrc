"
" vim-plug
"
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ciaranm/detectindent'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'mfukar/robotframework-vim'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'

call plug#end()

"
" Anything else
"
syntax on
filetype plugin indent on

set backspace=indent,eol,start
set binary
set clipboard=unnamed
set colorcolumn=81,121
set expandtab
set list
set listchars=tab:──,trail:·,extends:>,precedes:<
set modeline
set modelines=5
set mouse=a
set nocompatible
set number
set ruler
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
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"nnoremap \ :Ag<SPACE>

" ignore whitespace for git-gutter
let g:gitgutter_diff_args = '-w'

"nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
"nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>
