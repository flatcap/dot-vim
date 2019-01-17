" Copyright 2013-2015 Richard Russon (flatcap)
"
" Save and close the current window

function! quitter#SaveAndClose()
	" For a Gundo window, press 'q'
	let name = bufname('')
	if (name =~ '__Gundo_')
		normal q
		return
	endif

	" Normal Window - save, then close it.
	if ((&buftype == '') && (!empty (name)))
		execute 'silent update'
	endif
	quit!

	" If all that's left is a quickfix window, close that too.
	if ((winnr('$') == 1) && (&buftype == 'quickfix'))
		quit!
	endif

	" If all that's left are Gundo windows, close them too.
	if ((winnr('$') == 2) && (bufname(winbufnr(1)) =~ '__Gundo_') && (bufname(winbufnr(2)) =~ '__Gundo_'))
		quitall!
	endif
endfunction

