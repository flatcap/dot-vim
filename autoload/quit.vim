" Copyright 2013-2014 Richard Russon (flatcap)
"
" Save and close the current window

function! quit#SaveAndClose()
	" Normal Window
	if (&buftype == "")
		if (empty (bufname("")))
			quit!
		else
			execute 'silent update'
			quit
		endif
	elseif ((&buftype == "quickfix") || (&buftype == "help") || (&buftype == "nofile"))
		quit!
	endif
endfunction

