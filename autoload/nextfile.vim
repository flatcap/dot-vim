" Copyright 2014 Richard Russon (flatcap)
" NextFile -- Increase the file's suffix number and save it

function! nextfile#NextFile()
	let file = expand("%")
	let number = substitute (file, "^.*[^0-9]", "", "")
	if (empty(number))
		let stem = file
		let num  = 1
	else
		let stem = strpart(file, 0, len(file)-len(number))
		let num  = number+1
	endif
	execute "saveas ".stem.num
endfunction

