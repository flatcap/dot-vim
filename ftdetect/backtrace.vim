" auto-detect backtrace files

autocmd BufRead *	call <SID>backtrace()

function! s:backtrace()
	let name = expand('%:t')
	if (name !~ '\v^bt\d+$')
		return
	endif

	let line = getline (1)
	if (line !~ '\v^#\d+  \S')
		return
	endif

	let line = getline (2)
	if (line !~ '\v^#\d+  \S')
		return
	endif

	set filetype=backtrace
endfunction
