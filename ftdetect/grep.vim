" auto-detect grep output

autocmd BufRead * call <SID>grep()

function! s:grep()
	let match = '\v^[^:]+:\d+:'

	let line = getline (1)
	if (line !~ match)
		return
	endif

	let line = getline (2)
	if (line !~ match)
		return
	endif

	" Only set the filetype if it isn't already set
	setfiletype grep
endfunction
