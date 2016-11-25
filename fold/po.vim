" Copyright 2016 Richard Russon.

source ~/.vim/fold/deffold.vim

let s:arrow   = '⇒'
let s:trans   = ' '
let s:fuzzy   = '≈'
let s:untrans = '✗'
let s:lion    = '†'

function! Po_FoldText(lnum)
	let line = getline (a:lnum)
	if (a:lnum == 1)
		return s:arrow . '   ' .  substitute (line, '# ', '', '')
	endif

	let lion    = 0
	let fuzzy   = 0
	let missing = 0
	let line    = ''
	let msg     = ''

	for i in range(a:lnum, a:lnum+20)
		let prev = line
		let line = getline(i)

		if (line =~ '^#\. ')
			let lion = 1
		endif
		if (line =~ '^#.*\<fuzzy\>')
			let fuzzy = 1
		endif
		if ((line =~ '^msgid ') || (prev == 'msgid ""'))
			let msg = substitute (line, '^\(msgid \)*" *\(.*\) *"', '\2', '')
			let msg = substitute (msg, '\(\\t\)\+', ' ', 'g')
			let msg = substitute (msg, '\\n*', '', 'g')
			let msg = substitute (msg, '\.\+$', '', '')
		endif
		if ((prev == 'msgstr ""') && (line == ''))
			let missing = 1
		endif
		if (line == '')
			break
		endif
	endfor

	let str = ''
	if (missing == 1)
		let str .= s:untrans
	elseif (fuzzy == 1)
		let str .= s:fuzzy
	else
		let str .= s:trans
	endif
	if (lion == 1)
		let str .= ' ' . s:lion
	else
		let str .= '  '
	endif

	return str . ' ' . msg
endfunction

function! Po_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if (line != '')
		return '1'
	elseif ((prev != '') && (line == ''))
		return 's1'
	else
		return '='
	endif
endfunction


" Enable folding.
set foldexpr=Po_FoldLevel(v:lnum)
set foldtext=Po_FoldText(v:foldstart)

