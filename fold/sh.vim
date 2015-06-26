" Copyright 2004-2011 Richard Russon.
"
"	function jim()
"	{
"		echo jim
"	}
"
"	##
"	# Do something bobby
"	# more comments
"	function bob()
"	{
"	}

source ~/.vim/fold/deffold.vim

let g:prefun = 'function '	" prefix for a function
let g:precom = '# '		" prefix for a comment
let g:sufcom = '...'		" suffix for a comment

function! Sh_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	if ((prev =~ '^$') && (line =~ '^##$') && (next =~ '^# .*$'))
		let level = '>2'
	elseif ((prev =~ '^$') && ((line =~ '^\i\+\s*()$') || (line =~ 'function \i\+\s*()$')))
		let level = '>1'
	elseif ((prev =~ '^# .*$') && (line =~ '^.*()$') && (next =~ '^{$'))
		let level = '1'
	elseif (line =~ '^\i\+=($')
		let level = '1'
	elseif (prev =~ '^}$')
		let level = 's1'
	elseif (prev =~ '^)$')
		let level = 's1'
	else
		let level = '='
	endif

	return level
endfunction

function! Sh_GetFuncName(lnum)
	for i in range(a:lnum, a:lnum+20)
		let line = getline(i)
		if (line !~ '^#')
			let line = substitute (line, 'function ', '', '')
			let line = substitute (line, ' *().*', '', '')
			return line
		endif
	endfor
	return "unknown"
endfunction

function! Sh_FoldText(lnum)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	let text = ''

	if (v:foldlevel == 2)
		let comm = substitute (next, '# ', '', '')
		return g:precom . comm . g:sufcom
	else
		if (line =~ '^\i\+=($')
			return line . ')'
		else
			let func = Sh_GetFuncName(a:lnum)
			if (next =~ '^#')
				let comm = ' - ' . substitute (next, '# ', '', '')
				return g:prefun . func . comm
			else
				return g:prefun . func
			fi
		endif
	endif
endfunction


" Enable folding.
set foldexpr=Sh_FoldLevel(v:lnum)
set foldtext=Sh_FoldText(v:foldstart)

