" Colours used below
"	12 - darkblue
"	18 - very dark blue
"	22 - dark green
"	70 - green
"	124 - dark red
"	129 - dark purple
"	141 - light purple
"	142 - dark yellow
"	165 - purple
"	184 - yellow
"	207 - shocking pink
"	239 - dark grey

" Vim basics
highlight CursorColumn	ctermfg=white		ctermbg=22		cterm=none
highlight CursorLine	ctermfg=white		ctermbg=22		cterm=none
highlight Directory	ctermfg=yellow		ctermbg=none
highlight ErrorMsg	ctermfg=white		ctermbg=red		cterm=none
highlight Folded	ctermfg=green		ctermbg=none		cterm=none
highlight IncSearch	ctermfg=white		ctermbg=red		cterm=none
highlight LineNr	ctermfg=239		ctermbg=none
highlight MatchParen	ctermfg=white		ctermbg=darkblue
highlight ModeMsg	ctermfg=grey					cterm=none
highlight MoreMsg	ctermfg=green					cterm=none
highlight NonText	ctermfg=darkgrey	ctermbg=none
highlight Search	ctermfg=black		ctermbg=yellow		cterm=none
highlight SignColumn	ctermfg=70		ctermbg=none		cterm=none
highlight SpecialKey	ctermfg=darkcyan
highlight StatusLine	ctermfg=42		ctermbg=none		cterm=none
highlight StatusLineNC	ctermfg=black		ctermbg=none		cterm=none
highlight VertSplit	ctermfg=237		ctermbg=none		cterm=none
highlight Visual	ctermfg=black		ctermbg=white		cterm=none
highlight WarningMsg	ctermfg=black		ctermbg=yellow		cterm=none

" Tabs
highlight TabLine	ctermfg=12		ctermbg=none		cterm=none
highlight TabLineFill	ctermfg=none		ctermbg=none		cterm=none
highlight TabLineSel	ctermfg=grey		ctermbg=18		cterm=none
highlight Title		ctermfg=cyan		ctermbg=none		cterm=none

" Auto-completion
highlight Pmenu		ctermfg=white		ctermbg=22
highlight PmenuSel	ctermfg=red		ctermbg=22
highlight PmenuSBar	ctermfg=darkgrey	ctermbg=darkgrey
highlight PmenuThumb	ctermfg=white		ctermbg=white

" Vimdiff
highlight DiffAdd	ctermfg=black		ctermbg=142		cterm=none
highlight DiffChange	ctermfg=black		ctermbg=141		cterm=none
highlight DiffDelete	ctermfg=black		ctermbg=124		cterm=none
highlight DiffText	ctermfg=black		ctermbg=129		cterm=none

" Keywords common to many languages
highlight Comment	ctermfg=77					cterm=none
highlight String	ctermfg=229
highlight Todo		ctermfg=22		ctermbg=none		cterm=reverse
highlight Number	ctermfg=none

" highlight Type		ctermfg=red  cterm=reverse
highlight Statement	ctermfg=cyan cterm=none
"highlight Type		ctermfg=123
"highlight Statement	ctermfg=123
" highlight Type		ctermfg=123

" highlight Conditional	ctermfg=darkcyan
" highlight Include	ctermfg=darkcyan
" highlight Label		ctermfg=darkcyan
" highlight Macro		ctermfg=darkcyan
" highlight Operator	ctermfg=darkcyan
" highlight PreCondit	ctermfg=darkcyan
" highlight PreProc	ctermfg=darkcyan
" highlight Repeat	ctermfg=darkcyan
" highlight StorageClass	ctermfg=darkcyan
" highlight Structure	ctermfg=darkcyan

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

highlight black   ctermfg=black
highlight blue    ctermfg=blue
highlight cyan    ctermfg=cyan
highlight green   ctermfg=green
highlight magenta ctermfg=magenta
highlight red     ctermfg=red
highlight white   ctermfg=white
highlight yellow  ctermfg=yellow

