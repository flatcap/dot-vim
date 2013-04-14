" Copyright 2012 Richard Russon (flatcap)

function! ifzero#IfZero() range
	call append (a:lastline, "#endif")
	call append (a:firstline-1, "#if 0")
	call cursor (a:lastline+1, 0)
endfunction

