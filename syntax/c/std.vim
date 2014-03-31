
syntax match std_conceal   "\vstd::"            conceal
syntax match std_highlight "\vstd::\i+(::\i+)?" contains=std_conceal

highlight std_conceal   ctermfg=121
highlight std_highlight ctermfg=121

syntax match work_conceal   "\v(sigc|Pango|Cairo|Glib|Gdk|Gio|Gtk)::"            conceal
syntax match work_highlight "\v(sigc|Pango|Cairo|Glib|Gdk|Gio|Gtk)::\i+(::\i+)?" contains=work_conceal

highlight work_conceal   ctermfg=146
highlight work_highlight ctermfg=146

"syntax match cppSmartPtr "\(std::\)\?shared_ptr" conceal cchar=◆
"syntax match cppSmartPtr "\(std::\)\?unique_ptr" conceal cchar=●
"syntax match cppSmartPtr "\(std::\)\?weak_ptr" conceal cchar=◇

syntax match std_conceal   "__FUNCTION__" conceal cchar=ϝ
