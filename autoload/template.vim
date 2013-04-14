" Copyright 2013 Richard Russon (flatcap)

function! template#load(type, line, column)
	let filename = '~/.vim/templates/file.'.a:type
	execute "0r ".fnameescape(filename)
	let pos = getpos('.')
	let pos[1] = a:line
	let pos[2] = a:column
	call setpos('.', pos)
	execute "startinsert!"
endfunction

