" for python files:

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
"setlocal smarttab
"setlocal formatoptions=croql

" automatically create fold marks for the first level
" then go back to manual folding
setlocal foldmethod=indent
"setlocal foldlevel=99
"setlocal foldmethod=syntax
setlocal foldnestmax=1
setlocal foldmethod=manual
setlocal foldnestmax&

setlocal omnifunc=pythoncomplete#Complete
