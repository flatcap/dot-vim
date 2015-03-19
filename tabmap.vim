
for i in [1,2,4,8]
	execute 'nmap <Leader><Tab>'  .i.' :%!unexpand --tabs '.i.' --first-only<CR>'
	execute 'nmap <Leader><S-Tab>'.i.' :%!expand --tabs '.i.' --initial<CR>'
endfor

