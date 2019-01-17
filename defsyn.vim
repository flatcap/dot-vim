set termguicolors

hi Normal guifg=NONE guibg=NONE

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
highlight CursorColumn	ctermfg=white		ctermbg=22		cterm=none     guifg=white    guibg=#005f00
highlight CursorLine	ctermfg=white		ctermbg=22		cterm=none     guifg=white    guibg=#005f00
highlight Directory	ctermfg=yellow		ctermbg=none                           guifg=yellow   guibg=NONE
highlight ErrorMsg	ctermfg=white		ctermbg=red		cterm=none     guifg=white    guibg=red
highlight Folded	ctermfg=green		ctermbg=none		cterm=none     guifg=green    guibg=NONE
highlight IncSearch	ctermfg=white		ctermbg=red		cterm=none     guifg=white    guibg=red
highlight LineNr	ctermfg=239		ctermbg=none                           guifg=#4e4e4e      guibg=NONE
highlight MatchParen	ctermfg=white		ctermbg=darkblue                       guifg=white    guibg=darkblue
highlight ModeMsg	ctermfg=grey					cterm=none     guifg=grey
highlight MoreMsg	ctermfg=green					cterm=none     guifg=green
highlight NonText	ctermfg=darkgrey	ctermbg=none                           guifg=darkgrey guibg=NONE
highlight Search	ctermfg=black		ctermbg=yellow		cterm=none     guifg=black    guibg=yellow
highlight SignColumn	ctermfg=70		ctermbg=none		cterm=none     guifg=#5faf00       guibg=NONE
highlight SpecialKey	ctermfg=darkcyan                                               guifg=darkcyan
highlight StatusLine	ctermfg=42		ctermbg=none		cterm=none     guifg=#00d787       guibg=NONE
highlight StatusLineNC	ctermfg=black		ctermbg=none		cterm=none     guifg=black    guibg=NONE
highlight VertSplit	ctermfg=237		ctermbg=none		cterm=none     guifg=#3a3a3a      guibg=NONE gui=NONE
highlight Visual	ctermfg=black		ctermbg=white		cterm=none     guifg=black    guibg=white
highlight WarningMsg	ctermfg=black		ctermbg=yellow		cterm=none     guifg=black    guibg=yellow

" Tabs
highlight TabLine	ctermfg=12		ctermbg=none		cterm=none     guifg=#0000ff       guibg=NONE
highlight TabLineFill	ctermfg=none		ctermbg=none		cterm=none     guifg=NONE     guibg=NONE
highlight TabLineSel	ctermfg=grey		ctermbg=18		cterm=none     guifg=grey     guibg=#000087
highlight Title		ctermfg=cyan		ctermbg=none		cterm=none     guifg=cyan     guibg=NONE

" Auto-completion
highlight Pmenu		ctermfg=white		ctermbg=22                             guifg=white    guibg=#005f00
highlight PmenuSel	ctermfg=red		ctermbg=22                             guifg=red      guibg=#005f00
highlight PmenuSBar	ctermfg=darkgrey	ctermbg=darkgrey                       guifg=darkgrey guibg=darkgrey
highlight PmenuThumb	ctermfg=white		ctermbg=white                          guifg=white    guibg=white

" Vimdiff
highlight DiffAdd	ctermfg=black		ctermbg=142		cterm=none     guifg=black    guibg=#afaf00
highlight DiffChange	ctermfg=black		ctermbg=141		cterm=none     guifg=NONE     guibg=#180820
highlight DiffDelete	ctermfg=black		ctermbg=124		cterm=none     guifg=black    guibg=#af0000
highlight DiffText	ctermfg=black		ctermbg=129		cterm=none     guifg=black    guibg=#af00ff

" Keywords common to many languages
highlight Comment	ctermfg=77					cterm=none     guifg=#5fd75f
highlight String	ctermfg=229                                                    guifg=#ffffaf
highlight Todo		ctermfg=22		ctermbg=none		cterm=reverse  guifg=#005f00       guibg=NONE
highlight Number	ctermfg=none                                                   guifg=NONE

" highlight Type		ctermfg=red  cterm=reverse
highlight Statement	ctermfg=cyan cterm=none                                        guifg=cyan
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

highlight black   ctermfg=black                                                        guifg=#000000
highlight blue    ctermfg=blue                                                         guifg=#0000ff
highlight cyan    ctermfg=cyan                                                         guifg=#00ffff
highlight green   ctermfg=green                                                        guifg=#00ff00
highlight magenta ctermfg=magenta                                                      guifg=#ff00ff
highlight red     ctermfg=red                                                          guifg=#ff0000
highlight white   ctermfg=white                                                        guifg=#ffffff
highlight yellow  ctermfg=yellow                                                       guifg=#ffff00

highlight reverse   cterm=reverse
highlight underline cterm=underline

syntax match MergeConflict "^[<=>]\{7\}\( .*\)*$" containedin=cComment,automakeNoSubst
highlight MergeConflict ctermfg=black ctermbg=red guifg=black guibg=red

highlight conceal ctermfg=red ctermbg=none guifg=red guibg=NONE

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

highlight IndentGuidesOdd  ctermfg=242 ctermbg=0   guifg=grey15 guibg=grey30
highlight IndentGuidesEven ctermfg=0   ctermbg=242 guifg=grey30 guibg=grey15

highlight SpellBad guifg=red

highlight rainbow_p0 guifg=#0087d7
highlight rainbow_o0 guifg=#0087d7

highlight HighlightedyankRegion guifg=NONE guibg=#404040

hi folded guifg=#80ff80
hi todo guifg=#80ff80
hi comment guifg=#80ff80
