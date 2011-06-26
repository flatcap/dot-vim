" Copyright 2001-2010 Richard Russon.

source ~/.vim/fold/deffold.vim

if ($QV == 1)
	finish
endif

let s:prefix_comment   = "--> "
let s:prefix_copyright = "--> Copyright"
let s:prefix_function  = "F) "
let s:prefix_property  = "Property: "
let s:prefix_section   = "Section: "
let s:prefix_signal    = "Signal: "

let s:abbreviation     = "..."

" TODO:
"     count the number of function parameters (@arg)
"     look for keywords like: static, inline, etc

" Determine if the code needs folding
function! C_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	let nex2 = getline (a:lnum + 2)

	" Ignore one-line C comments
	let prev = substitute (prev, '/\*[^*]*\*/', '', '')
	if (line =~ '^.*/\*.*\*/')
		let level = '='

	" Very specific comment blocks
	elseif ((line =~ '^/\*\*\=') && (next =~ '^ \* Copyright.*'))
		let level = '>1'
	elseif ((line =~ '^/\*\*\=') && (next =~ '^ \* SECTION:.*'))
		let level = '>1'

	" Function/Signal/Property comment block
	elseif ((line =~ '^\s\+/\*\*\=') && (next =~ '^\s\+\* [_a-z]\+::\=.*'))
		let level = 'a1'
	elseif ((line =~ '^/\*\*.*') && (next =~ '^ \* [_a-z]\+.*'))
		let level = '>2'
	elseif ((line =~ '^/\*\*\=.*') && (next =~ '^ \* [_a-z]\+.*') && (nex2 =~ '^ \* @[_a-z]\+.*'))
		let level = '>2'
	"elseif ((line =~ '^/\*\*\=.*') && (next =~ '^ \* [_a-z]\+:.*'))
	"	let level = '>2'

	" Normal comment blocks
	elseif ((line =~ '^.*/\*.*'))
		let level = 'a1'

	" End of folds
	elseif ((line =~ '^.*\*/') && (next !~ '^$'))
		let level = 's1'
	elseif ((prev =~ '^.*\*/') && (line =~ '^$'))
		let level = 's1'
	elseif (prev[0] == '}')
		let level = '<1'

	else
		let level = '='
	endif
	return level
endfunction

" Fold a copyright message
function! C_FoldCopyright(lnum)
	" Don't bother
	return s:prefix_copyright
endfunction

" Fold a section message
function! C_FoldSection(lnum)
	let desc = getline (a:lnum)
	let desc = substitute (desc, '^ \* section: ', '', '')
	return s:prefix_section . desc
endfunction

" Fold a signal or property comment
function! C_FoldSigProp(lnum)
	let desc = getline (a:lnum)
	if (desc =~ '^.*::.*')
		let desc = substitute (desc, ' \* ', s:prefix_signal, '')
	else
		let desc = substitute (desc, ' \* ', s:prefix_property, '')
	endif
	let desc = substitute (desc, '\t', '        ', 'g')
	return desc
endfunction

" Read a function's comment block and abbreviate it.
function! C_FoldFunction(lnum)
	let desc = getline (a:lnum)
	let desc = substitute (desc, '^ \* *', '', '')
	let endline = getline (foldclosedend(a:lnum))
	if (endline =~ '^.*\*/')
		let desc = s:prefix_comment . desc
	else
		let desc = s:prefix_function . desc
		let s = v:foldend - v:foldstart + 1
		let desc = desc . ' ('.s.')'
	endif
	return desc
endfunction


" We've found a block comment, so abbreviate it.
" If it stretches to more than one line, append '...'
function! C_FoldComment(lnum)
	let line = getline (a:lnum)
	let next = getline (a:lnum+1)
	let nex2 = getline (a:lnum+2)

	let space = substitute (line, '\(\s*\).*', '\1', '')
	let line = substitute (line, '\s*/\* *', '', '')
	let next = substitute (next, '\s*\* *', '', '')
	let next = substitute (next, '\s*\*/$', '', '')
	let nex2 = substitute (nex2, '\s*\* *', '', '')

	if (line == '')
		let text = l:next
	else
		let text = line
	endif

"	if (next !~ '^\s*\*/.*')
"		" Truncate comment to screen width
"		let c = &columns - strlen(s:abbreviation)
"		let c = '^\(.\{' . c . '}\).*'
"		let line = substitute (line, c, '\1', '')
"		let line = line . s:abbreviation
"	endif
	let space = substitute (space, '\t', '        ', 'g')
	return space . s:prefix_comment . text
endfunction

" Determine the type of comment, then abbreviate it.
function! C_FoldText(lnum)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	let nex2 = getline (a:lnum + 2)

	if ((line =~ '^/\*\*\=') && (next =~ '^ \* Copyright.*'))
		let text = C_FoldCopyright(a:lnum + 1)
	elseif ((line =~ '^/\*\*\=') && (next =~ '^ \* SECTION:.*'))
		let text = C_FoldSection(a:lnum + 1)
	elseif ((line =~ '^\s\+/\*\*\=') && (next =~ '^\s\+\* [_a-z]\+::\=.*'))
		let text = C_FoldSigProp(a:lnum + 1)

	elseif ((line =~ '^/\*\*.*') && (next =~ '^ \* [_a-z]\+.*'))
		let text = C_FoldFunction(a:lnum + 1)
	elseif ((line =~ '^/\*\*\=.*') && (next =~ '^ \* [_a-z]\+.*') && (nex2 =~ '^ \* @[_a-z]\+.*'))
		let text = C_FoldFunction(a:lnum + 1)
	"elseif ((line =~ '^/\*\*\=.*') && (next =~ '^ \* [_a-z]\+:.*'))
	"	let text = C_FoldFunction(a:lnum + 1)

	else
		let text = C_FoldComment(a:lnum)
	endif

	return text
endfunction

" Enable folding.
set foldexpr=C_FoldLevel(v:lnum)
set foldtext=C_FoldText(v:foldstart)

