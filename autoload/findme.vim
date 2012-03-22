" Copyright 2012 Richard Russon.
"
" Move the cursor to some commonly used places.

function! findme#Constructor()
	let i = 0

	while i < 100
		let line = getline (i)
		if (line =~ '^\([a-zA-Z][a-zA-Z_0-9]\+\)::\1\s*(.*$')
			call cursor (i, 0)
			execute 'normal zt|zv'
		endif
		let i += 1
	endwhile
endfunction

function! findme#Destructor()
	let i = 0

	while i < 100
		let line = getline (i)
		if (line =~ '^\([a-zA-Z][a-zA-Z_0-9]\+\)::\~\1\s*(.*$')
			call cursor (i, 0)
			execute 'normal zt|zv'
		endif
		let i += 1
	endwhile
endfunction

function! findme#Include()
	let i = 100

	while i >= 0
		let line = getline (i)
		if (line =~ '^\s*#\s*include\s.*')
			call cursor (i, 0)
			execute 'normal zz|zv'
			break
		endif
		let i -= 1
	endwhile
endfunction

