" git index line
syntax match diffFile "\v^index \x{7}\.\.\x{7} \d{6}$"

highlight diffRemoved	ctermfg=red       guifg=#ff8080
highlight diffAdded	ctermfg=yellow    guifg=#ffff80

highlight diffOnly	ctermfg=red       guifg=#ff8080
highlight diffDiffer	ctermfg=red       guifg=#ff8080
highlight diffBDiffer	ctermfg=red       guifg=#ff8080
highlight diffIsA	ctermfg=red       guifg=#ff8080
highlight diffNoEOL	ctermfg=red       guifg=#ff8080

highlight diffIdentical ctermfg=green     guifg=#80ff80
highlight diffCommon	ctermfg=green     guifg=#80ff80

highlight diffChanged	ctermfg=171       guifg=#d75fff
highlight diffLine	ctermfg=darkcyan  guifg=#00ffff

highlight diffFile	ctermfg=darkgreen guifg=#00ff00
highlight diffComment	ctermfg=darkgreen guifg=#00ff00

highlight diffSubname	ctermfg=none      guifg=NONE

