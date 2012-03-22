" Copyright 2012 Richard Russon.
"
" Switch between c/cc/cpp and h/hpp files

function! swapfile#SwapFile()
	let src = [ 'c', 'cpp', 'cc' ]
	let hdr = [ 'h', 'hpp' ]

	let file = bufname("%")

	let bits = split(file, '\.')
	if len (bits) != 2
		return
	endif
	let basename = bits[0]
	let suffix   = bits[1]

	if (index(src,suffix) >= 0)
		for i in hdr
			if filereadable(basename.'.'.i)
				execute 'edit' fnameescape(basename.'.'.i)
				break
			endif
		endfor
	elseif (index(hdr,suffix) >=0)
		for i in src
			if filereadable(basename.'.'.i)
				execute 'edit' fnameescape(basename.'.'.i)
				break
			endif
		endfor
	endif
endfunction

