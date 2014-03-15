syntax on

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
highlight Directory	ctermfg=darkcyan	ctermbg=black
highlight ErrorMsg	ctermfg=black		ctermbg=red		cterm=none
highlight IncSearch	ctermfg=black		ctermbg=red		cterm=none
highlight LineNr	ctermfg=239		ctermbg=none
highlight MatchParen	ctermfg=white		ctermbg=darkblue
highlight ModeMsg	ctermfg=grey					cterm=none
highlight MoreMsg	ctermfg=green					cterm=none
highlight NonText	ctermfg=darkgrey	ctermbg=none
highlight Search	ctermfg=black		ctermbg=yellow		cterm=none
highlight SignColumn	ctermfg=70		ctermbg=black		cterm=none
highlight SpecialKey	ctermfg=darkcyan
highlight StatusLine	ctermfg=42		ctermbg=none		cterm=none
highlight StatusLineNC	ctermfg=22		ctermbg=none		cterm=none
highlight VertSplit	ctermfg=22		ctermbg=none		cterm=none
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
highlight Comment	ctermfg=darkgreen				cterm=none
highlight String	ctermfg=184
highlight SpecialChar	ctermfg=165
highlight Todo		ctermfg=darkgreen	ctermbg=black		cterm=reverse
highlight clear Number

highlight Conditional	ctermfg=darkcyan
highlight Constant	ctermfg=darkcyan
highlight Include	ctermfg=darkcyan
highlight Label		ctermfg=darkcyan
highlight Macro		ctermfg=darkcyan
highlight Operator	ctermfg=darkcyan
highlight PreCondit	ctermfg=darkcyan
highlight PreProc	ctermfg=darkcyan
highlight Repeat	ctermfg=darkcyan
highlight Statement	ctermfg=darkcyan
highlight StorageClass	ctermfg=darkcyan
highlight Structure	ctermfg=darkcyan
highlight Type		ctermfg=darkcyan
highlight Folded	ctermfg=22		ctermbg=none		term=none

