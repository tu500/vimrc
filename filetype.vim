"my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.txt  setfiletype text
"  au! BufRead,BufNewFile *.xyzsetfiletype drawing
augroup END
