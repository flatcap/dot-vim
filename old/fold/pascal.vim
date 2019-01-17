" Copyright 2001-2004 Richard Russon.

source ~/.vim/fold/deffold.vim

let g:prefun = '  '		" prefix for a function
let g:preprc = '  '		" prefix for a procedure
let g:precls = '  '		" prefix for a class
let g:pretyp = '  '		" prefix for a type

function! Pascal_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	let level = '='

	if (line[0] =~ '\s')
		if (line =~ '.*=.* class[ (].*')
			let level = '>1'
		elseif (line =~ '.*\<record\>$')
			let level = '>1'
		elseif (next =~ '^begin')
			let level = 's1'
		elseif (next =~ '^var')
			let level = 's1'
		endif
	else
		if ((line =~ '^procedure') || (line =~ '^function') || (line =~ '^constructor') || (line =~ '^destructor') || (line =~ '^uses'))
			let level = '1'
    elseif (line =~ '^const')
			let level = 'a1'
		elseif (next =~ '^implementation')
			let level = '0'
		elseif (next =~ '^type')
			let level = '<1'
		"elseif (prev =~ '^  end;')
		"	let level = '<1'
		elseif ((prev =~ '^end;') || (prev =~ '^const[^r]') || (prev =~ '^type'))
			let level = '<1'
		elseif (line =~ '^var')
			let level = 'a1'
		"elseif ((line =~ '^begin') && (prev =~ ''))
		"	let level = '>1'
		elseif ((next =~ '^procedure') || (next =~ '^function') || (next =~ '^constructor') || (next =~ '^destructor') || (next =~ '^uses'))
			let level = '0'
		endif
	endif
	return level
endfunction

function! Pascal_FoldRecord(lnum)
	let desc = getline (a:lnum)
	let class = substitute (desc, '^\s\+\(\i\+\)[ =].*', '\1', '')
	let desc = g:pretyp . class
	return desc
endfunction

function! Pascal_FoldDefinition(lnum)
	let desc = getline (a:lnum)
	let class = substitute (desc, '^\s\+\(\i\+\)[ =].*', '\1', '')
	let base = substitute (desc, '.*class\s*(\s*\(.*\)\s*).*', '\1', '')
	let desc = g:precls . class . ' : ' . base
	return desc
endfunction

function! Pascal_FoldFunction(lnum)
	let desc = getline (a:lnum)
	let suffix = ''
	let prefix = ''

	if (desc =~ '^constructor.*')
		let suffix = ' (ctor)'
		let prefix = g:preprc
	elseif (desc =~ '^destructor.*')
		let suffix = ' (dtor)'
		let prefix = g:preprc
	elseif (desc =~ '^function')
		let prefix = g:prefun
	elseif (desc =~ '^procedure')
		let prefix = g:preprc
	endif
	
	let desc = substitute (desc, '^\i\+ ', '', '')
	let desc = substitute (desc, '[;: (].*', '', '')
	let desc = prefix . desc . suffix
	return desc
endfunction

function! Pascal_FoldText(lnum)
	let line = getline (a:lnum)

	if (line[0] =~ '\s')
		if (line =~ '.*record$')
			return Pascal_FoldRecord(a:lnum)
		else
			return Pascal_FoldDefinition(a:lnum)
		endif
	else
		return Pascal_FoldFunction(a:lnum)
	endif
endfunction


" Enable folding.
set foldexpr=Pascal_FoldLevel(v:lnum)
set foldtext=Pascal_FoldText(v:foldstart)

