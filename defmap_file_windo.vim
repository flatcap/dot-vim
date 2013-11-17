" Pipe into command
nmap <Leader>w1 :windo %!<Space>
vmap <Leader>w1 :windo !<Space>

" Strip the first two characters off each line -- useful for find(1) output
nmap <Leader>w2 :windo %s/^..//<CR>
vmap <Leader>w2 :windo s/^..//<CR>

" End of line
nmap <Leader>w4 :windo %s/$//<Left>
vmap <Leader>w4 :windo s/$//<Left>

" All of selection/file
nmap <Leader>w5 :windo %s/
vmap <Leader>w5 :windo s/

" Start of line
nmap <Leader>w6 :windo %s/^
vmap <Leader>w6 :windo s/^

" Everything
nmap <Leader>w8 :windo %s/.*//<Left>
vmap <Leader>w8 :windo s/.*//<Left>

" Strip leading path component
nmap <Leader>w/ :windo %s!^[^/]\+/*!!<CR>
vmap <Leader>w/ :windo s!^[^/]\+/*!!<CR>

" Pipe into:windo  sort, sort -R (random), uniq, grep, column -t
nmap <Leader>wpc :windo %!LANG=C column -t<CR>
nmap <Leader>wpg :windo %!LANG=C grep<Space>""<Left>
nmap <Leader>wpn :windo %!LANG=C nl -nrz -w4<CR>
nmap <Leader>wpr :windo %!LANG=C sort -R<CR>
nmap <Leader>wps :windo %!LANG=C sort -f<CR>
nmap <Leader>wpt :windo %!LANG=C tac<CR>
nmap <Leader>wpu :windo %!LANG=C uniq<CR>

vmap <Leader>wpc :windo !LANG=C column -t<CR>
vmap <Leader>wpg :windo !LANG=C grep<Space>""<Left>
vmap <Leader>wpn :windo !LANG=C nl -nrz -w4<CR>
vmap <Leader>wpr :windo !LANG=C sort -R<CR>
vmap <Leader>wps :windo !LANG=C sort -f<CR>
vmap <Leader>wpt :windo !LANG=C tac<CR>
vmap <Leader>wpu :windo !LANG=C uniq<CR>

" Delete whitespace:windo  Leading 6^, Trailing 4$, Before Tab <Tab>, Blank lines <Enter>
nmap <Leader>w<Space>4       :windo %s/\s\+$//e<CR>
nmap <Leader>w<Space>6       :windo %s/^\s\+//e<CR>
nmap <Leader>w<Space><Enter> :windo %g/^\s*$/de<CR>
nmap <Leader>w<Space><Tab>   :windo %s/<Space>\+<Tab>/<Tab>/e<CR>

vmap <Leader>w<Space>4       :windo s/\s\+$//e<CR>
vmap <Leader>w<Space>6       :windo s/^\s\+//e<CR>
vmap <Leader>w<Space><Enter> :windo g/^\s*$/de<CR>
vmap <Leader>w<Space><Tab>   :windo s/<Space>\+<Tab>/<Tab>/e<CR>

