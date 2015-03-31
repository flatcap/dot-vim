" Copyright 2015 Richard Russon.

source ~/.vim/fold/deffold.vim

let s:function = '▶'

function! Css_FoldText(lnum)
	let line = getline (a:lnum)

	let line = substitute (line, '\s*{.*', '', '')

	let num = v:foldend - v:foldstart - 2

	return s:function . ' ' . line . ' (' . num . ')'
endfunction

function! Css_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)

	if (line =~ '\s*{\s*$')
		return 'a1'
	elseif ((prev =~ '^}$') && (line == ''))
		return 's1'
	elseif (line =~ '^}$')
		return 's1'
	else
		return '='
	endif
endfunction


" Enable folding.
set foldexpr=Css_FoldLevel(v:lnum)
set foldtext=Css_FoldText(v:foldstart)

