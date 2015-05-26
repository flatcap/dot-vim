" Copyright 2014-2015 Richard Russon.

source ~/.vim/fold/deffold.vim

let s:global_function = '●'
let s:local_function  = '○'
let s:comment         = '▶'

function! Vim_FoldText(lnum)
	let line = getline (a:lnum)
	let icon = s:local_function

	if (line =~ '^function!*\s.*')
		let line = substitute (line, '^function!*\s*', '', '')
		let line = substitute (line, '\s*(.*', '', '')
		if (line =~ '^\i\+#.*')
			let icon = s:global_function
			let line = substitute (line, '^\i\+#', '', '')
		elseif ((line =~ '^g:.*') || (line =~# '^[A-Z][^:].*'))
			let icon = s:global_function
		endif
		let line = substitute (line, '^[gs]:', '', '')
	else
		let line = substitute (line, '^"\s*', '', '')
		let icon = s:comment
	endif

	return icon . ' ' . line
endfunction

function! Vim_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if (line =~ '^function!*\s.*')
		return '1'
	elseif (prev =~ '^endfunction$')
		return 's1'
	elseif (((a:lnum == 1) || (prev == '')) && (line =~ '^" ') && (next =~ '^" '))
		return '>2'
	elseif ((prev =~ '^" ') && (line == ''))
		return '0'
	else
		return '='
	endif
endfunction


" Enable folding.
set foldexpr=Vim_FoldLevel(v:lnum)
set foldtext=Vim_FoldText(v:foldstart)

