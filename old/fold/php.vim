" Copyright 2005 Richard Russon.

source ~/.vim/fold/deffold.vim

function! PHP_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if (line =~ '^/\*\*.*')						" /**
		let level = '>2'
	elseif ((line =~ '^\s*/\*.*') && (next =~ '^\s*\*\s.*'))	" /*	*
		let level = 'a1'
	elseif ((line =~ '^\s*\*/.*') && (prev =~ '^\s*\*\s.*'))	" */	*
		let level = 's1'
	elseif (prev[0] == '}')						" }
		let level = '<1'
	elseif ((line =~ '^function.*$')) " && (prev =~ '^$'))
		let level = '>1'
	elseif ((line =~ '^function.*$') && (prev !~ '^\s*\*/.*'))
		let level = 's1'
	elseif (prev =~ '^}$')
		let level = '<1'
	else
		let level = '='
	endif

	return level
endfunction

function! PHP_FoldText(lnum)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if (line =~ '^/\*\*.*')
		let desc = substitute (next, '^\s*\*\s\+', '', '')
	elseif (line =~ '^function.*')
		let desc = substitute (line, '^function\s*', '', '')
		let desc = substitute (desc, '(.*', '', '')
	else
		let desc = line
	endif
	let desc = '// ' . desc
	return desc
endfunction


" Enable folding.
set foldexpr=PHP_FoldLevel(v:lnum)
set foldtext=PHP_FoldText(v:foldstart)

