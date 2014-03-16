" Simple highlighting for grep output

syntax match grep_filename "^[^:]\+"
syntax match grep_linenum ":\zs\d\+\ze:"

highlight grep_filename ctermfg=cyan
highlight grep_linenum ctermfg=yellow
