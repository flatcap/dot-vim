" Copyright 2005-2010 Richard Russon.

source ~/.vim/fold/deffold.vim

function! Diff_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if ((next =~ '^diff.*') ||
	  \ (next =~ '^Only in.*') ||
	  \ (next =~ '^Files .* are identical'))
		let level = 's1'
	elseif ((line =~ '^diff.*') ||
	      \ ((line =~ "^---.*") && (prev !~ 'index .*')) ||
	      \ (line =~ '^commit.*'))
		let level = 'a1'
	elseif (((line =~ '^$') && (prev !~ '^Date:.*')) ||
	      \ (next =~ '^commit.*'))
		let level = '<1'
	else
		let level = '='
	endif
	return level
endfunction

function! Diff_FoldText(lnum)
	let line = getline (a:lnum)
	if (line =~ '^commit.*')
		"let line = substitute (line, '^....\([^	]\+\)	.*', '\1', '')
	elseif (line =~ '^---.*')
		let line = substitute (line, '^....\([^	]\+\)	.*', '\1', '')
	else
		let line = substitute (line, '^.* ', '', 'g')
	endif
	"let line = 'diff ' . line
	let line = line . ' (' . (v:foldend - v:foldstart - 3) . ')'
	return line
endfunction

" Enable folding.
set foldexpr=Diff_FoldLevel(v:lnum)
set foldtext=Diff_FoldText(v:foldstart)

