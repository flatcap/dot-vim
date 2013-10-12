" Copyright 2013 Richard Russon (flatcap)
"
" Save and close the current window

function! quit#SaveAndClose()
	if &buftype == ""
		execute 'silent update'
	endif
	quit
endfunction

