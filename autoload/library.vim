" library

function! library#Highlight(group, filename, colour)
	if (!filereadable (a:filename))		" Does the file exist?
		return
	endif

	for line in readfile(a:filename)
		execute "syntax keyword" a:group line
	endfor

	execute "highlight" a:group "ctermfg=" a:colour
endfunction

