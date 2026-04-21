setl iskeyword+=-

" Look up CSS property on MDN using <Leader>r
" Uses a simple URL pattern — every CSS property page on MDN follows:
"   https://developer.mozilla.org/en-US/docs/Web/CSS/<property-name>
let s:mdnBase = 'https://developer.mozilla.org/en-US/docs/Web/CSS/'
nnoremap <buffer> <Leader>r bye:exe "!elinks ".fnameescape(s:mdnBase . '<C-R>"')<CR>
