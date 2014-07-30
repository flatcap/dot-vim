" Copyright 2014 Richard Russon.

source ~/.vim/fold/deffold.vim

if ($QV == 1)
	finish
endif

let s:function = '●'

function! Vim_FoldText(lnum)
	let line = getline (a:lnum)

	if (line =~ '^function!*\s.*')
		let line = substitute (line, '^function!*\s*', '', '')
		let line = substitute (line, '\s*(.*', '', '')
	endif

	return s:function . ' ' . line
endfunction

function! Vim_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)

	if (line =~ '^function!*\s.*')
		return 'a1'
	elseif (prev =~ '^endfunction$')
		return 's1'
	else
		return '='
	endif
endfunction


" Enable folding.
set foldexpr=Vim_FoldLevel(v:lnum)
set foldtext=Vim_FoldText(v:foldstart)

