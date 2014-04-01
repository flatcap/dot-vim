" Copyright 2014 Richard Russon (flatcap)
" Mark ctor, dtor and include

let cursor_pos = getpos('.')

call cursor(0,0)
if (search ('\v^(\i+)::\1\s*\(', 'cW', 0, 50) > 0)
	call setpos ("'c", getpos('.'))
endif

call cursor(0,0)
if (search ('\v^(\i+)::\~\1\s*\(', 'cW', 0, 50) > 0)
	call setpos ("'d", getpos('.'))
endif

call cursor(200,0)
if (search ('\v^#include', 'bcW', 0, 50) > 0)
	call setpos ("'i", getpos('.'))
endif

call setpos ('.', cursor_pos)

