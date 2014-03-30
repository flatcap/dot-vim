" Copyright 2012-2013 Richard Russon (flatcap)
"
" Make and display the quickfix window if necessary

function! make#RichMake()
	execute 'wall'
	execute 'silent !clear'
	execute 'wincmd t'
	execute 'silent make | redraw!'
	execute 'botright cwindow 5'
	
	let num = bufnr ('$')
	let b = 1
	let success = 1
	while b <= num
		if (bufexists (b))
			if (getbufvar (b, "&buftype") == "quickfix")
				execute "cc"
				execute "normal zvzz"
				let success = 0
				break
			endif
		endif

		let b = b + 1
	endwhile

	if (success)
		echohl CursorLine
		echom "make successful"
		echohl None
	endif
endfunction

