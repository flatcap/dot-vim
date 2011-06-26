" Copyright 2004 Richard Russon.

source ~/.vim/fold/deffold.vim

let g:prefun = 'function '	" prefix for a function

function! Sh_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if ((prev =~ '^$') && (line =~ '^##$') && (next =~ '^# .*$'))
		let level = '>2'
	elseif ((prev =~ '^$') && (line =~ '^.*()$'))
		let level = '>1'
	elseif ((prev =~ '^# .*$') && (line =~ '^.*()$') && (next =~ '^{$'))
		let level = 's1'
	elseif (prev =~ '^}$')
		let level = 's1'
	else
		let level = '='
	endif

	return level
endfunction

function! Sh_FoldText(lnum)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if (line =~ '^##$')
		let text = substitute (next, '# ', '', '')
	else
		let text = substitute (line, '()', '', '')
	endif

	return g:prefun . text
endfunction

" Enable folding.
set foldexpr=Sh_FoldLevel(v:lnum)
set foldtext=Sh_FoldText(v:foldstart)

