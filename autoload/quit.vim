" Copyright 2013-2014 Richard Russon (flatcap)
"
" Save and close the current window

function! quit#SaveAndClose()
	" Normal Window
	if ((&buftype == "") && (!empty (bufname(""))))
		execute 'silent update'
	endif
	quit!
endfunction

