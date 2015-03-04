" Copyright 2001-2015 Richard Russon.

source ~/.vim/fold/deffold.vim

let s:function = '▶'

function! Perl_FoldText(lnum)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	let nex2 = getline (a:lnum + 2)

	let fn = substitute (line, 'sub \+\(\i\+\)\( *{\)*', '\1', '')

	if (next =~ '^{$')
		let args = nex2
	else
		let args = next
	endif
	let args = substitute (args, '\s\+my \+\(([^)]\+)\) *= *@_;', '\1', '')
	let args = substitute (args, '\$', '', 'g')

	return s:function . ' ' . fn . ' ' . args

endfunction

function! Perl_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)

	if (line =~ '^sub .*')
		let level = 'a1'
	elseif ((prev =~ '^}') && (line == ""))
		let level = '<1'
	else
		let level = '='
	endif
	return level
endfunction


" Enable folding.
set foldexpr=Perl_FoldLevel(v:lnum)
set foldtext=Perl_FoldText(v:foldstart)

