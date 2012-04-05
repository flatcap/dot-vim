" Copyright 2012 Richard Russon.
"
" Switch between c/cc/cpp and h/hpp files

function! swapfile#SwapFile()
	let src = [ 'c', 'cpp', 'cc' ]
	let hdr = [ 'h', 'hpp' ]

	let file = bufname("%")

	let bits = split(file, '\.')
	if (len (bits) != 2)				" If the filename has more than one dot
		return					" give up, for now
	endif
	let basename = bits[0]
	let suffix   = bits[1]

	if (index(src,suffix) >= 0)			" Select some suffixes to try
		let search = hdr
	elseif (index(hdr,suffix) >= 0)
		let search = src
	else
		return
	endif

	for i in search
		let filename = basename.'.'.i
		if (!filereadable (filename))		" Does the file exist?
			continue
		endif

		let n = bufnr (filename)		" Is is loaded already?
		let win_count = winnr ('$')
		let w = 1
		while (w <= win_count)			" Is it in a visible window?
			if (winbufnr (w) == n)		" Yes, so go there
				execute w . "wincmd w"
				break
			endif
			let w += 1
		endwhile

		if (bufname("%") != filename)		" If we're now not looking at the file
			execute 'edit' fnameescape (filename)
		endif
		break
	endfor
endfunction

