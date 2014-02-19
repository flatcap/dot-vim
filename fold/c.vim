" Copyright 2001-2014 Richard Russon.

source ~/.vim/fold/deffold.vim

if ($QV == 1)
	finish
endif

let s:prefix_comment   = '--> '
let s:prefix_function  = 'F) '
let s:abbreviation     = '...'

let s:prefix_ctor	= 'ctor'
let s:prefix_dtor	= 'dtor'

let s:prefix_copyright	= '© Copyright'

let s:function_method	= '●'
let s:function_local	= '○'
let s:function_static	= '∗'

" TODO:
"     count the number of function parameters (@arg)
"     look for keywords like: static, inline, etc

" Determine if the code needs folding
function! C_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	let nex2 = getline (a:lnum + 2)
	let nex3 = getline (a:lnum + 3)

	echohl line

	" Ignore one-line C comments
	let prev = substitute (prev, '/\*[^*]*\*/', '', '')
	if (line =~ '^.*/\*.*\*/')
		let level = '='

	" Very specific comment blocks
	elseif (line =~ '^/\* Copyright.*')
		let level = '>2'
	elseif ((line =~ '^/\*\*\=') && (next =~ '^ \* SECTION:.*'))
		let level = '>1'

	" Function/Signal/Property comment block
	elseif ((line =~ '^\s\+/\*\*\=') && (next =~ '^\s\+\* [_a-zA-Z]\+::\=.*'))
		let level = 'a1'
	elseif ((line =~ '^/\*\*.*') && (next =~ '^ \* [~_a-zA-Z]\+.*'))
		let level = '>2'
	elseif ((line =~ '^/\*\*\=.*') && (next =~ '^ \* [_a-zA-Z]\+.*') && (nex2 =~ '^ \* @[_a-zA-Z]\+.*'))
		let level = '>2'
	"elseif ((line =~ '^/\*\*\=.*') && (next =~ '^ \* [_a-zA-Z]\+:.*'))
	"	let level = '>2'

	" Normal comment blocks
	elseif ((line =~ '^.*/\*.*'))
		let level = 'a1'

	elseif ((line =~ '^template.*') && (nex3 =~ '^{$}'))
		echom "template"
		let level = 'a1'

	" End of folds
	elseif ((prev =~ '^ \*/') && (a:lnum < 20) && (getline (1) =~ "^/*"))
		let level = 0
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
	if (&foldlevel < 2)
		return s:prefix_copyright
	endif

	let line = getline (a:lnum)
	let line = substitute (line, '^/\* Copyright (c) \d\d\d\d\(-\d\d\d\d\)\? ', '', '')
	return s:prefix_copyright . ' ' . line
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
function! C_FoldInclude(line, count)
	if (&foldlevel < 2)
		return '#include'
	endif

	if (a:line =~ '^#include ".*')
		let text = '""'
	elseif (a:line =~ '^#include <.*\.h>')
		let text = '<h>'
	else
		let text = '<>'
	endif

	let text = '#include ' . text . ' (' . a:count . ')'
	return text
endfunction

function! C_FoldCtor (text)
	let class = substitute (a:text, '::.*', '\1', '')
	let ctor  = substitute (a:text, '^\(.*\)::\1\s*', '', '')

	if ((ctor == "()") || (ctor == "(void)"))
		let ctor = "default"
	elseif (ctor =~ '(const ' . class . '&\s*\i\+).*')
		let ctor = "copy"
	elseif (ctor =~ "(" . class . '&&\s*\i\+).*')
		let ctor = "move"
	else
		let ctor = "other"
	endif

	return s:prefix_ctor ." (" . ctor . ")"
endfunction

function! C_FoldFunction2(lnum)
	let text = "Function!"
	let static = 0
	for i in range(0,4)
		let line = getline (a:lnum+i)
		if (line =~ '^static.*')
			let static = 1
		elseif (line =~ '.*(.*')
			break
		endif

	endfor
	if (line =~ '^\i\+::\~*\i\+\s*(.*')
		let text = substitute (line, '\s*(.*', '', '')

		if (text =~ '^\(.*\)::\1')
			let text = C_FoldCtor (line)
		elseif (text =~ '^\(.*\)::\~\1')
			let text = substitute (text, '^\(.*\)::\~\1', s:prefix_dtor, '')
		else
			let text = substitute (text, '^.*::', '', '')
		endif
		let text = s:function_method . ' ' . text
	else
		let text = substitute (line, '\s*(.*', '', '')
		if (static)
			let text = s:function_static . ' ' . text
		else
			let text = s:function_local . ' ' . text
		endif
	endif
	return text
endfunction

" Determine the type of comment, then abbreviate it.
function! C_FoldText(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	let nex2 = getline (a:lnum + 2)
	let nex3 = getline (a:lnum + 3)

	if (prev =~ '^\s\+for\s(.*')
		let s = v:foldend - v:foldstart - 1
		let line = substitute (line, '\t', '        ', 'g')
		if (1)
			let line = substitute (line, '[^ ].*', '', '')
			return line . s . " lines..."
		else
			if (0)
				let line = substitute (line, '\s*{.*', '', '')
				return line . " {" . s . " lines}"
			else
				let line = substitute (line, '\s*(.*', '', '')
				return line . " (" . s . " lines)"
			endif
		endif
	endif

	if (line =~ "^#include.*")
		let s = v:foldend - v:foldstart
		return C_FoldInclude(line, s)
	endif

	if ((line =~ '^/\* Copyright.*'))
		let text = C_FoldCopyright(a:lnum)
		return text
	endif

	return C_FoldFunction2(a:lnum)

	elseif ((line =~ '^/\*\*\=') && (next =~ '^ \* SECTION:.*'))
		let text = C_FoldSection(a:lnum + 1)
	elseif ((line =~ '^\s\+/\*\*\=') && (next =~ '^\s\+\* [_a-zA-Z]\+::\=.*'))
		let text = C_FoldSigProp(a:lnum + 1)

	elseif ((line =~ '^/\*\*.*') && (next =~ '^ \* [~_a-zA-Z]\+.*'))
		let text = C_FoldFunction(a:lnum + 1)
	elseif ((line =~ '^/\*\*\=.*') && (next =~ '^ \* [_a-zA-Z]\+.*') && (nex2 =~ '^ \* @[_a-zA-Z]\+.*'))
		let text = C_FoldFunction(a:lnum + 1)
	"elseif ((line =~ '^/\*\*\=.*') && (next =~ '^ \* [_a-zA-Z]\+:.*'))
	"	let text = C_FoldFunction(a:lnum + 1)

	elseif ((line =~ '^template.*') && (nex3 =~ '^{$}'))
		let text = nex2;

	else
		let text = C_FoldComment(a:lnum)
	endif

	return text
endfunction

function! C_FoldLevel2(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	let nex2 = getline (a:lnum + 2)
	let nex3 = getline (a:lnum + 3)
	let nex4 = getline (a:lnum + 4)
	let nex5 = getline (a:lnum + 5)	" enough for 6 lines of preamble

	if (prev =~ '#\(if\|else\|endif\).*')
		let prev = ""
	endif

	if ((line =~ '^template.*') && (nex3 =~ '^{$'))
		let level = 'a1'

	elseif ((prev == "") && (line =~ '.*(.*') && (next =~ '^{$'))
		let level = 'a1'

	elseif ((prev == "") && (line != "") && (next =~ '.*(.*') && (nex2 =~ '^{$'))
		let level = 'a1'

	" Very specific comment blocks
	elseif (line =~ '^/\* Copyright.*')
		let level = '>3'

	elseif (line =~ '^/\*\*$')
		let level = '>2'

	elseif (line =~ '/\*\*$')
		let level = 'a1'
	elseif (line =~ '/\*\s')
		let level = 'a1'

	" elseif (prev =~ '^\s\+for\s*(.*)\s*{$')
	" 	let level = 'a1'
	" elseif (next =~ '^\s\+}$')
	" 	let level = 's1'

	elseif ((prev == "") && (line =~ '^#include.*'))
	"elseif ((prev =~ "^\([^#].*\)\=$") && (line =~ '^#include.*'))
		let level = '>3'

	elseif ((prev =~ '^#include.*') && (line == ""))
		if (next =~ '^#include.*')
			let level = '<3'
		else
			let level = 0
		endif

	elseif ((line =~ '^#include.*') && (next == "") && (nex2 !~ '^#include'))
		let level = '<1'

	elseif ((prev =~ '^ \*/') && (a:lnum < 20) && (getline(1) =~? '^/\* Copyright.*'))
		let level = '<1'

	elseif (line =~ '\*/')
		let level = 's1'

	elseif (prev[0] == '}')
		let level = '<1'

	else
		let level = '='
	endif
	return level
endfunction


" Enable folding.
set foldexpr=C_FoldLevel2(v:lnum)
set foldtext=C_FoldText(v:foldstart)

