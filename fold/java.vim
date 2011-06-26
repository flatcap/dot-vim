" Copyright 2001-2003 Richard Russon.

source ~/.vim/fold/deffold.vim

let g:prefix = '+ '

function! Java_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

	let level = '='

	if (line =~ '^public.*[^};]$')
		let level = 'a1'
	elseif (line =~ '^	public.*[^};]$')
		let level = 'a1'

	elseif ((line =~ '^import.*$') && (prev =~ '^ *$'))
		let level = 'a1'
	elseif ((line =~ '^ *$') && (prev =~ '^import.*$'))
		let level = 's1'

	elseif (line =~ '^protected.*[^};]$')
		let level = 'a1'
	elseif (line =~ '^	protected.*[^};]$')
		let level = 'a1'

	elseif (line =~ '^private.*[^};]$')
		let level = 'a1'
	elseif (line =~ '^	private.*[^};]$')
		let level = 'a1'

	elseif ((line =~ '^}.*') && (next != ''))
		let level = 's1'

	elseif (prev =~ '^}.*')
		let level = 's1'

	elseif ((line =~ '^	}.*') && (next != ''))
		let level = 's1'

	elseif (prev =~ '^	}.*')
		let level = 's1'

	endif
	return level
endfunction

function! Java_FoldText(lnum)
	let desc = getline (a:lnum)
	let suffix = ''
	let prefix = substitute (desc, '[^	 ].*', '', '') . g:prefix
	let prefix = substitute (prefix, '[	]', '    ', 'g')
	let desc = substitute (desc, '\s*(.*', '', '')
	let desc = substitute (desc, '.* ', '', '')
	let desc = prefix . desc . suffix
	return desc
endfunction

" Enable folding.
set foldexpr=Java_FoldLevel(v:lnum)
set foldtext=Java_FoldText(v:foldstart)
