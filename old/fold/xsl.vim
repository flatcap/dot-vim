" Copyright 2004 Richard Russon.

source ~/.vim/fold/deffold.vim

let g:pretemp = '// template '		" prefix for a template


function! XSL_FoldLevel(lnum)
	let prev = getline (a:lnum - 1)
	let line = getline (a:lnum)
	let next = getline (a:lnum + 1)
	let nnxt = getline (a:lnum + 1)

	if (line =~ '^\s*<xsl:template.*')
		let level = 'a1'
	elseif (nnxt =~ '^<\/xsl:stylesheet>')
		let level = '0'
	elseif (prev =~ '^\s*<\/xsl:template>')
		let level = 's1'
	else
		let level = '='
	endif

	return level
endfunction

" The fold text is taken from the second line of the comment block.
" It is preprocessed to remove the asterisk.
function! XSL_FoldText(lnum)
	let line = getline (a:lnum)
	let line = substitute (line, '\t', '        ', 'g')
	let line = substitute (line, 'name="', 'name  ', 'g')
	let line = substitute (line, 'match="', 'match ', 'g')
	let line = substitute (line, '<xsl:template ', g:pretemp, '')
	let line = substitute (line, '">', '', 'g')
	return line
endfunction


" Enable folding.
set foldexpr=XSL_FoldLevel(v:lnum)
set foldtext=XSL_FoldText(v:foldstart)

