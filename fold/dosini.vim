" Copyright 2004 Richard Russon.

source ~/.vim/fold/deffold.vim

function! Dosini_FoldLevel(lnum)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	if (line =~ '^\[.*\]$')
		let level = '>1'
	elseif (next =~ '^[.*]$')
		let level = '<0'
	else
		let level = '='
	endif
	return level
endfunction

function! Dosini_FoldText(lnum)
	return getline (a:lnum)
endfunction


" Enable folding.
set foldexpr=Dosini_FoldLevel(v:lnum)
set foldtext=Dosini_FoldText(v:foldstart)

