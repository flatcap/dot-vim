" Copyright 2012 Richard Russon (flatcap)

function! tagsrotate#TagsRotate()
	let tagdict = {
	\	0: "tags",
	\	1: "tags,/usr/include/tags",
	\	2: "tags,/usr/include/tags,/usr/src/debug/tags",
	\ }

	let match = -1

	for key in keys(tagdict)
		if &tags == tagdict[key]
			let match = key
			break
		endif
	endfor

	let match = (match + 1) % 3
	let &tags = tagdict[match]
	set tags?
endfunction

