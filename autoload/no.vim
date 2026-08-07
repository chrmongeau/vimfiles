function! no#OpenRemoteLink(link)
	if match(a:link, 'http://') != -1
		echo 'HTTP LINK ' . a:link
	elseif match(a:link, 'ftp://') != -1
		echo 'FTP LINK'
	elseif match(a:link, 'gopher://') != -1
		echo 'gopher LINK'
	endif
endfu

function! no#OpenLocalLink(link, str)

	if fnamemodify(a:link, ':e') == 'pdf'
		echo 'PDF file ' . a:link
	elseif fnamemodify(a:link, ':e') == 'html'
		echo 'HTML file ' . a:link
	else
		if a:str == '|'
			normal g
		elseif a:str == '{'
			normal yi{
			if $TERM == 'screen'
				exe "silent! !screen ".s:REMOTEBROWSER." ".@"
				normal 
			endif
		elseif a:str == '[' || a:str == '<'
			let fullpath = fnamemodify(expand('%:p'), ':h')
			let head = fnamemodify(a:link, ':h')
			let file = fnamemodify(a:link, ':t')
			let dir = fullpath . '/' . head
			let file = dir . '/' . file . '.no' " XXX '.no' = variable 'extension'
			if filewritable(file) == 0 " 0 -> o non esiste o non si può scrivere
				if isdirectory(dir) == 0
					if exists("*mkdir")
						call mkdir(dir, 'p')
					else
						echo "ERROR: can't create dir"
					endif
				endif
				try
					" TODO fnameescape()
					call writefile([], file)
				catch
					echo 'ERRRROOORRRR'
				endtry
			endif
			"" gf non funziona se [[filename]] (senza estensione)
			"normal gf
			exe 'edit ' . file
		else
			echo 'ERROR1'
		endif
	endif
endfu

" Come rendere la funzione locale solo a file .no ???
function! no#OpenLocationNO()
    " restituire a @" il suo contenuto
    let char = @"

	let save_cursor = getpos('.')
    normal yaW
    let aword = @"
	"let aword = substitute(aword, '^ *\\(.\\{-\\}\\) *$', '\\1', '')
	"echo aword
	call setpos('.', save_cursor)

	let x = aword[0]
	let aword = substitute(aword, '^[^[:alnum:]]*\(.\{-\}\)[^[:alnum:]]*$', '\1', '')

	if match(aword, '://') != -1
		call no#OpenRemoteLink(aword)
	else
		call no#OpenLocalLink(aword, x)
	endif
endfu

function! no#DecreaseLevel()
	normal 0
	let cursor1 = getpos('.')
	normal ^
	let cursor2 = getpos('.')
	let cursormove = cursor2[2] - cursor1[2] - 2
	let tabs = repeat('	', cursormove)
	call setline('.', [getline('.'), '', tabs])
	let cursor2[1] = cursor2[1] + 2
	let cursor2[2] = cursor2[2] - 2
	call setpos('.', cursor2)
endfu
