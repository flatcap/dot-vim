" Copyright 2010 Richard Russon.

let s:prefix  = '--> '
let s:comment = '^#-\{20,\}$'

" Determine if the code needs folding
function! Make_FoldLevel(lnum)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if (line =~ s:comment)
		let level = '>1'
	elseif (next =~ s:comment)
		let level = '<1'
	else
		let level = '='
	endif
	return level
endfunction

" Use the comment as a label.
function! Make_FoldText(lnum)
	let desc = getline (a:lnum+1)
	let desc = substitute (desc, '^# *', '', '')
	let desc = s:prefix . desc
	return desc
endfunction


" Remove the defaults first.
highlight Folded     term=none ctermfg=none ctermbg=none
highlight FoldColumn term=none ctermfg=none ctermbg=none

" Add some custom colours.
"highlight Folded     term=none ctermfg=green ctermbg=darkgrey
"highlight FoldColumn term=none ctermfg=black ctermbg=darkgrey

" Or leave the folds comment coloured.
highlight link Folded     Comment
highlight link FoldColumn Comment

" Enable folding.
set foldexpr=Make_FoldLevel(v:lnum)
set foldtext=Make_FoldText(v:foldstart)
set foldmethod=expr

" Enable debugging
"set debug=msg

" More preferences
set foldlevel=0
set foldcolumn=0
"set foldmethod=manual
set foldclose=
set foldopen=mark,tag

