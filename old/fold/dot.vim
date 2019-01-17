" Copyright 2014 Richard Russon.

source ~/.vim/fold/deffold.vim

let s:style   = '      ★'
let s:cluster = '      ●'

function! Dot_FoldText(lnum)
	let line = getline (a:lnum)

	if (line =~ '.*[$')
		return s:style . ' ' . substitute (line, '^\s\+\(\i\+\) [$', '\1', '')
	elseif (line =~ '^\t\i\+ \[.*//.*$')
		let tag = substitute (line, '^\s\+\(\i\+\) [.*$', '\1', '')
		let msg = substitute (line, '^.*// *\(.*\)', '\1', '')
		return s:style . ' ' . tag . ' (' . msg . ')'
	elseif (line =~ '\tsubgraph.*')
		return s:cluster . ' ' . substitute (line, '^\s\+\S\+ \+cluster_*\(\i\+\) {$', '\1', '')
	endif
endfunction

function! Dot_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if ((line =~ '^\t\i\+ \[$') || (line =~ '^\t\i\+ \[.*//.*$'))
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

