" Copyright 2012-2014 Richard Russon (flatcap)

function! ifzero#IfZero() range
	call append (a:lastline, "#endif")
	call append (a:firstline-1, "#if 0")
	call cursor (a:lastline+1, 0)
endfunction

function! ifzero#IfRar() range
	call append (a:lastline, "#endif")
	call append (a:firstline-1, "#ifdef RAR")
	call cursor (a:lastline+1, 0)
endfunction

