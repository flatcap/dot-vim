" Common to all folded files

" Remove the defaults first.
highlight Folded     term=none ctermfg=none ctermbg=none
highlight FoldColumn term=none ctermfg=none ctermbg=none

" Add some custom colours.
"highlight Folded     term=none ctermfg=green ctermbg=darkgrey
"highlight FoldColumn term=none ctermfg=black  ctermbg=darkgrey

" Or leave the folds comment coloured.
highlight link Folded     Comment
highlight link FoldColumn Comment

" Enable folding.
set fillchars=vert:\|,fold:\ 
set foldmethod=expr

" Enable debugging
"set debug=msg

" More preferences
set foldlevel=0
set foldcolumn=0
"set foldmethod=manual
set foldclose=
set foldopen=mark,tag,quickfix

" map 0 :set fdl=0<CR>
" map 1 :set fdl=1<CR>
" map 2 :set fdl=2<CR>
" map 3 :set fdl=3<CR>

