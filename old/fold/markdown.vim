" Copyright 2016-2017 Richard Russon.

source ~/.vim/fold/deffold.vim

function! Markdown_FoldText(lnum)
	let line = getline (a:lnum)

	let num = v:foldend - v:foldstart - 1

	if (line == '---')
		return '● yaml'
	endif

	if (line =~ '^##\= ')
		let indent = '● '
	else
		let indent = '  ○ '
	endif
	let line = substitute (line, '#* ', '', '')
	let line = substitute (line, '<.\{-\}>', '', 'g')
	let line = substitute (line, '^\s\+', '', '')

	return indent . line . ' (' . num . ')'
endfunction

function! Markdown_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if ((a:lnum == 1) && (line == '---'))
		return '>3'
	elseif ((prev == '---') && (line == '') && (a:lnum < 10))
		return '<3'
	elseif (line =~ '^##\= ')
		return '>1'
	elseif (line =~ '^### ')
		return '>2'
	else
		return '='
	endif
endfunction


" Enable folding.
set foldexpr=Markdown_FoldLevel(v:lnum)
set foldtext=Markdown_FoldText(v:foldstart)

