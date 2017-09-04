set laststatus=2

"
" Statusline
"
hi StatusLine ctermbg=white  ctermfg=darkgray   guibg=white guifg=darkgray

hi User1 ctermfg=black    ctermbg=darkcyan guifg=black    guibg=darkcyan
hi User2 ctermfg=darkcyan ctermbg=yellow   guifg=darkcyan guibg=yellow
hi User3 ctermfg=black    ctermbg=yellow   guifg=black    guibg=yellow
hi User4 ctermfg=yellow   ctermbg=darkgray guifg=yellow   guibg=darkgray
hi User5 ctermfg=cyan     ctermbg=darkgray guifg=yellow   guibg=darkgray
hi User6 ctermfg=black    ctermbg=cyan     guifg=yellow   guibg=darkgray
hi User7 ctermfg=magenta  ctermbg=cyan  guifg=yellow   guibg=darkgray
hi User8 ctermfg=white    ctermbg=magenta  guifg=yellow   guibg=darkgray

" powerline symbols
let g:powerline_left_sep =      "\ue0b0"
let g:powerline_left_alt_sep =  "\ue0b1"
let g:powerline_right_sep =     "\ue0b2"
let g:powerline_right_alt_sep = "\ue0b3"
let g:powerline_symbols = {}
let g:powerline_symbols.linenr = '☰'
let g:powerline_symbols.maxlinenr = ''
let g:powerline_symbols.paste = 'Þ'
let g:powerline_symbols.paste = 'ρ'
let g:powerline_symbols.paste = '∥'
let g:powerline_symbols.readonly = ''
let g:powerline_symbols.spell = 'Ꞩ'
let g:powerline_symbols.whitespace = 'Ξ'

if ! exists("*ProjectName")
  " A better solution for %{getcwd()}.
  "
  " Usage:
  "   set statusline=%{ProjectName()}
  function ProjectName()
    let l:path = expand('%:p')
    return (l:path =~# '^/Users/iwat/Workspaces/.\+')
          \ ? substitute(l:path, '^/Users/iwat/Workspaces/\([^/]*\)/.*', '\1', '')
          \ : substitute(getcwd(), '^.*/\([^/]*\)', '\1', '')
  endfunction

  " A replacement for %m
  func StatusLineM()
    if &modified
      return " +"
    else
      return ""
    end
  endfunction

  " A replacement for %r
  func StatusLineR()
    if &readonly || ! &modifiable
      return " " . g:powerline_symbols.readonly
    else
      return ""
    end
  endfunction

  func StatusLinePaste()
    if &paste
      return " " . g:powerline_symbols.paste
    else
      return ""
    end
  endfunction

  func StatusLineSpell()
    if &spell
      return " " . g:powerline_symbols.spell
    else
      return ""
    end
  endfunction
end

set statusline=%1*
set statusline+=%{ProjectName()}
set statusline+=%2*
set statusline+=%{g:powerline_left_sep}
set statusline+=%3*
set statusline+=\ %t    "tail of the filename
set statusline+=%{StatusLineM()}
set statusline+=%{StatusLineR()}
set statusline+=%{StatusLineSpell()}
set statusline+=%4*
set statusline+=%{g:powerline_left_sep}
set statusline+=%{StatusLinePaste()}
set statusline+=%*
set statusline+=%=
set statusline+=%5*
set statusline+=%{g:powerline_right_sep}
set statusline+=%6*
set statusline+=%3c\    "cursor column
set statusline+=%{g:powerline_symbols.linenr}\ %3l/%3L\ %{g:powerline_symbols.maxlinenr}\ "
set statusline+=%7*
set statusline+=%{g:powerline_right_sep}
set statusline+=%8*
set statusline+=%{strlen(&fenc)?&fenc.g:powerline_right_alt_sep:''} "file encoding
set statusline+=\ %{&ff}\  "file format
set statusline+=%{g:powerline_right_alt_sep}
set statusline+=\ %{substitute(&filetype,'^\[(.+)\]$','\1','')}
set statusline+=%h      "[help]
set statusline+=%q      "[* List]
set statusline+=%w\     "[Preview] for preview window flag
