" Copyright 2011-2015 Richard Russon (flatcap)
" library

function! library#Highlight(filename, ...)
	let l:opt_syntax = (a:0 > 0) ? a:1 : 'ctermfg=lightblue guifg=#30c0c0'
	let l:opt_group  = (a:0 > 1) ? a:2 : 'library_group'

	if (!filereadable (a:filename))
		echohl error
		echom 'Library cannot read file: ' . a:filename
		echohl none
		return
	endif

	for l:line in readfile(a:filename)
		execute 'syntax keyword ' . l:opt_group . ' ' . l:line
	endfor

	execute 'highlight ' . l:opt_group . ' ' . l:opt_syntax
endfunction

