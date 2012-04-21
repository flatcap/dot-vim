" git index line
syntax match diffFile "\v^index \x{7}\.\.\x{7} \d{6}$"

highlight diffRemoved	ctermfg=red
highlight diffAdded	ctermfg=yellow

highlight diffOnly	ctermfg=red
highlight diffDiffer	ctermfg=red
highlight diffBDiffer	ctermfg=red
highlight diffIsA	ctermfg=red
highlight diffNoEOL	ctermfg=red

highlight diffIdentical ctermfg=green
highlight diffCommon	ctermfg=green

highlight diffChanged	ctermfg=171
highlight diffLine	ctermfg=darkcyan

highlight diffFile	ctermfg=darkgreen
highlight diffComment	ctermfg=darkgreen

highlight diffSubname	ctermfg=none

