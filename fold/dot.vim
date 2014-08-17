" Copyright 2014 Richard Russon.

source ~/.vim/fold/deffold.vim

if ($QV == 1)
	finish
endif

let s:function = '      ●'

function! Dot_FoldText(lnum)
	let line = getline (a:lnum)

	if (line =~ '.*[$')
		let line = substitute (line, '^\s\+\(\i\+\) [$', '\1', '')
	elseif (line =~ '\tsubgraph.*')
		let line = substitute (line, '^\s\+\S\+ \+\(\i\+\) {$', '\1', '')
	endif

	return s:function . ' ' . line
endfunction

function! Dot_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if (line =~ '^\t\i\+ \[$')
		return 'a1'
	elseif (line =~ '^\tsubgraph \i\+ {$')
		return 'a1'
	elseif (prev =~ '^\t\];$')
		return 's1'
	elseif ((prev =~ '^\t}$') && (line =~ '^$'))
		return 's1'
	elseif ((line =~ '^\t}$') && (next !~ '^$'))
		return 's1'
	else
		return '='
	endif
endfunction


" Enable folding.
set foldexpr=Dot_FoldLevel(v:lnum)
set foldtext=Dot_FoldText(v:foldstart)

