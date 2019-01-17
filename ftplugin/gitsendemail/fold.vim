" Copyright 2018 Richard Russon.
finish

function! DiffFoldText (lnum)
	let line = getline (a:lnum)

	if (line =~ '^From ')
		let line = getline(a:lnum + 3)
		let line = substitute (line, '^Subject: ', 'Patch: ', '')
	elseif (line =~ '^diff ')
		let line = substitute (line, ' .* b/', ' ', '')
	elseif (line =~ '^@@ ')
		let line = substitute (line, ' .* @@', '', '')
	endif

	return line
endfunction

setlocal foldtext=DiffFoldText(v:foldstart)
