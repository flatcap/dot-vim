" auto-detect dos ini file

autocmd BufRead * call <SID>dosini()

function! s:dosini()
	let match = '^\[[-a-z]\+\]$'

	let l1 = getline(1)
	let l2 = getline(2)

	if ((l1 =~ match) || (l2 =~ match))
		source ~/.vim/fold/dosini.vim
	endif
endfunction
