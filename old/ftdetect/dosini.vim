" auto-detect dos ini file

autocmd BufRead * call <SID>dosini()

function! s:dosini()
	let l:match   = '^\[[-a-z]\+\]$'
	let l:comment = '^\s*[#;].*$'
	let l:empty   = '^\s*$'

	let l:success = 0
	for l:i in range (1, 15)
		let l:line = getline (l:i)
		if (l:line =~? l:match)
			" Definintely a dosini file
			let l:success = 1
			break
		endif
		if ((l:line !~? l:comment) && (l:line !~? l:empty))
			" Definintely not a dosini file
			break
		endif

		" Undecided, keep looking
	endfor

	if (l:success == 1)
		source ~/.vim/fold/dosini.vim
	endif
endfunction
