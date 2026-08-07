" KNOWN BUGS
" * [[file]] a fine riga copia anche lo spazio prima di "[["


let s:REMOTEBROWSER = 'elinks'
let s:LOCALNIXBROWSER = ''
let s:LOCALWINBROWSER = ''

setlocal listchars+=tab:\|.
setlocal list
setlocal ai foldmethod=indent
setlocal ts=2 sw=2
setlocal tw=76
"setlocal cpo+=I
 
"au BufWinEnter <buffer> let zzz = getline(1,"$")

" adapted from http://www.vim.org/tips/tip.php?tip_id=1327
" (preventing 'autoindent' to remove indentation)
"inoremap <CR> <CR><Space><BS>
inoremap <buffer> <CR> <CR><Space><C-H>
"nnoremap <buffer> o o<space><C-H>
"nnoremap <buffer> O O<space><C-H>
inoremap <buffer> <BS> <Esc>:call no#DecreaseLevel()<CR>A
noremap <buffer> <Leader><Up> V}<
noremap <buffer> <Leader><Down> V}>
noremap <buffer> <Leader><Left> V/	$<CR><
" XXX òò°°òò per rimuovere highlight
noremap <buffer> <Leader>. V/	$<CR>gq/òò°°òò<CR>


nmap <buffer> <CR> :call no#OpenLocationNO()<CR>
" Nota: ho eliminato <SID> presente sotto e spostato la funzione
" OpenLocationNO() in plugin/no.vim perché sennò creava errore E127
" http://vim.1045645.n5.nabble.com/How-do-one-open-files-for-editing-from-a-function-td1153531.html
" Senza <SID> è globale: wat do?
"nmap <buffer> <CR> :call <SID>OpenLocationNO()<CR>
"nmap <buffer> <CR> T[yt]:call OpenLocationNO('<C-R>"')<CR>

" http://vim.wikia.com/wiki/Best_Vim_Tips#Launching_programs_under_Windows
nmap <buffer> <F7> vi]y:silent! !cmd /cstart <C-R>"<CR><CR>
nmap <buffer> <F1> <Esc>"+[pV']gq<CR>

nmap <buffer> <Backspace> <C-o>
nmap <buffer> <Leader>d :let @"=strftime('%Y-%m-%d\|%H:%M', localtime())<Cr>i<C-r>"<Space>

inoremap <Leader><Bar> <Bar>

" automatic lists
"setlocal formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s*
setlocal formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[:.)}\\t\ ]*\\s*
setlocal formatoptions=tn

fu! NotesToHTML()
	%s@^\(\w\+\)$@<XXX>\1</XXX>@g
	" subsitute() ???
	let i = 5
	while i >= 1
		" se è un file HTML stand-alone allora i header senza
		" indent iniziale sono h1, quindi j lo faccio partire
		" da i+2. Se è parte di un altro documento i header iniziali
		" saranno h2, TODO: sistema (dando un'opzione)!
		let j = i+1
		exe ":%s@^\t\\{".i."\\}\\(\\w*\\)\\n\\(\t\\{".j."\\}\\)@\\r<h".j.">\\1</h".j.">\\r\\2@ge"
		let i-=1
	endwhile
	
	%s/^\t\+//g
endfu
