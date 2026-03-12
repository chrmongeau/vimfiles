" ATT: <SID>fun()... OR s:fun()... ????????????????????
" http://www.nabble.com/How-do-I-define-a-function-in-an-autocmd--td20436313.html
imap <buffer> <Leader>l <Esc>:call <SID>HTMLahref()<CR>
imap <buffer> <Leader>s <Esc>:call <SID>HTMLinline("span")<CR>
imap <buffer> <Leader>a <Esc>:call <SID>HTMLinline("abbr")<CR>

setlocal tw=76

fu! <SID>HTMLahref()
	let link = input("Link: ")
	if link == '' 
		echo 'I need a link!!!'
		return 1
	endif	

	let ext = input("External? (y/N) ")
	if ext != ''
		let ext = ' rel="external"'
	endif

	let lang = input("hreflang :")
	if lang != ''
		let lang = ' hreflang="' . lang . '"'
	endif

	let text = input("Text: ")
	if text == ''
		let text = link
	endif

	exe "normal a"."<a href=\"".link."\"".ext.lang.">".text."</a>  "
	startinsert
endfu

fun! s:HTMLinline(tag)
	let thetag = a:tag . ': '
	let t = input(thetag)
	if t == ''
		echo 'ERROR'
		return 1
	endif
	
	if a:tag == 'span'
		let title = input("Title? ")
		if title != ''
			let title = ' title="' . title . '"'
		endif
	else
		let title = input("Title: ")
		if title == ''
			echo a:tag . ' NEEDS a title!'
			return 1
		else
			let title = ' title="' . title . '"'
		endif
	endif

	let lang = input("Lang? ")
	if lang != ''
		let lang = ' xml:lang="' . lang . '" lang="' . lang . '"'
	endif
	
	exe "normal a"."<".a:tag.lang.title.">".t."</".a:tag.">  "
	startinsert
endfu
