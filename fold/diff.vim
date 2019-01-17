" Copyright 2005-2011 Richard Russon.

source ~/.config/nvim/fold/deffold.vim

function! Diff_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if ((next =~ '^diff.*') ||
	  \ (next =~ '^Only in.*') ||
	  \ (next =~ '^Binary files .* differ') ||
	  \ (next =~ '^Files .* are identical'))
		let level = '<1'
	elseif (line =~ '^diff.*')
		let level = 'a1'
	else
		let level = '='
	endif
	return level
endfunction

function! Diff_FoldText(lnum)
	let line = getline (a:lnum)
	let line = substitute (line, '^.* ', '', 'g')
	let line = substitute (line, '^[^/]\+/', '', 'g')
	let line = '▶ ' . line . ' (' . (v:foldend - v:foldstart - 3) . ')'
	return line
endfunction


" Enable folding.
set foldexpr=Diff_FoldLevel(v:lnum)
set foldtext=Diff_FoldText(v:foldstart)
