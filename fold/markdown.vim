" Copyright 2016 Richard Russon.

source ~/.vim/fold/deffold.vim

function! Markdown_FoldText(lnum)
	let line = getline (a:lnum)

	let num = v:foldend - v:foldstart - 1

	let line = substitute (line, '#', '', 'g')

	return '    ▶' . line . ' (' . num . ')'
endfunction

function! Markdown_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)

    if ((line == '') && (next =~ '^## '))
        return '1'
    elseif (line =~ '^## ')
        return '>1'
    elseif (line =~ '^### ')
        return '>2'
    else
        return '='
    endif
endfunction


" Enable folding.
set foldexpr=Markdown_FoldLevel(v:lnum)
set foldtext=Markdown_FoldText(v:foldstart)

