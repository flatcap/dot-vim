" Common to all folded files

" Remove the defaults first.
highlight Folded     term=none ctermfg=none ctermbg=none
highlight FoldColumn term=none ctermfg=none ctermbg=none

" Add some custom colours.
highlight Folded     term=none guifg=#00ff00 guibg=#000000
highlight FoldColumn term=none guifg=#00ff00 guibg=#000000

" Or leave the folds comment coloured.
" highlight link Folded     Comment
" highlight link FoldColumn Comment

" Enable folding.
set foldmethod=expr

" Enable debugging
"set debug=msg

set foldcolumn=0
"set foldmethod=manual
set foldminlines=0
set foldclose=
set foldopen=
set foldopen+=mark
set foldopen+=tag
set foldopen+=quickfix
"set foldopen+=search
set foldlevel=4
set foldtext=

" map 0 :set fdl=0<CR>
" map 1 :set fdl=1<CR>
" map 2 :set fdl=2<CR>
" map 3 :set fdl=3<CR>
"hi FoldColumn ctermbg=17

