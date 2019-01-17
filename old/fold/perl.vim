" Copyright 2001-2015 Richard Russon.

source ~/.vim/fold/deffold.vim

let s:function   = '▶'
let s:show_args  = 0
let s:show_lines = 0

function! Perl_FoldText(lnum)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	let nex2 = getline (a:lnum + 2)

	if (line =~ '#!.*')
		return line
	endif

	let fn = substitute (line, 'sub \+\(\i\+\)\( *{\)*', '\1', '')

	let args = ''
	if (s:show_args)
		if (next =~ '^{$')
			let args = nex2
		else
			let args = next
		endif

		if (args =~ 'my .* @_;')
			let args = substitute (args, '\s\+my \+\(([^)]\+)\) *= *@_;', '\1', '')
			let args = substitute (args, '\$', '', 'g')
		else
			let args = ''
		endif
		let args = ' ' . args
	endif

	let fn = s:function . ' ' . fn
	let fn = fn . args

	if (s:show_lines)
		let lines = v:foldend - v:foldstart - 1
		let fn = fn . ' : ' . lines
	endif

	return fn

endfunction

function! Perl_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if (line =~ '^sub .*')
		let level = 'a1'
	elseif ((prev =~ '^}') && (line == ""))
		let level = '<1'
	elseif (a:lnum == 1)
		let level = 'a1'
	elseif ((line =~ '^$') && (next =~ '^sub '))
		let level = '0'
	else
		let level = '='
	endif
	return level
endfunction


" Enable folding.
set foldexpr=Perl_FoldLevel(v:lnum)
set foldtext=Perl_FoldText(v:foldstart)

