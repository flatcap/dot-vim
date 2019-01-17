
" Next section
nmap <buffer> [[ :echo search('\v^diff\|^From ', 'Wb')<CR>
nmap <buffer> ]] :echo search('\v^diff\|%$',     'W')<CR>

" Next paragraph
nmap <buffer> { :echo search('\v^diff\|^[@0-9]\|^From ', 'Wb')<CR>
nmap <buffer> } :echo search('\v^diff\|^\@\@\|%$',       'W')<CR>

