" Copyright 2012-2014 Richard Russon (flatcap)
"
" Move the cursor to some commonly used places.

function! findme#Constructor()
	for i in range(1,100)
		if (getline(i) =~? '\v^(\h\w+)::\1\s*\(.*$')
			call cursor (i, 0)
			execute 'normal zt|zv'
			break
		endif
	endfor
endfunction

function! findme#Destructor()
	for i in range(1,100)
		if (getline(i) =~? '\v^(\h\w+)::\~\1\s*\(.*$')
			call cursor (i, 0)
			execute 'normal zt|zv'
			break
		endif
	endfor
endfunction

function! findme#Include()
	for i in range(100,1,-1)
		if (getline (i) =~# '\v^\s*#\s*include\s.*')
			call cursor (i, 0)
			execute 'normal zz|zO'
			break
		endif
	endfor
endfunction

