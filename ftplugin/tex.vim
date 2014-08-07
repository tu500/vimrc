" Latex Compile Rules
" enabling forward search
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'latex -src-specials -interaction=nonstopmode $*'
let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_CompileRule_pdf = 'pdflatex -src-specials -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_ViewRule_pdf = 'okular'
let g:Tex_ViewRuleComplete_pdf = 'okular $*.pdf &>/dev/null &'

" Formats that potentially need to be compiled more than once
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

" Needed those for one project, until next time they are here
"let g:Tex_CompileRule_pdf = 'lualatex -src-specials -interaction=nonstopmode $*'
"let g:Tex_UseMakefile = 0

" Better to live with the normal parentheses
call UnmapUmlaute()

" Custom formatting script
" (keeps environments and latex commands unwrapped)
set formatprg='$HOME/bin/format-latex.py'

" Compile and show latex document
" For okular and xdvik
nnoremap <leader>la :w<cr>:call Tex_RunLaTeX()<cr>:call Tex_ForwardSearchLaTeX()<cr>:redraw!<cr>
nnoremap <leader>ld :w<cr>:call Tex_RunLaTeX()<cr>:call Tex_ForwardSearchLaTeX()<cr>:silent !i3-msg '[title="xdvik"] focus' &> /dev/null<cr>:redraw!<cr>


" override the ultisnips mapping
" (use latex suite placeholders)
" TODO: harmonize them somehow?
imap <buffer> <C-J> <Plug>IMAP_JumpForward
nmap <buffer> <C-J> <Plug>IMAP_JumpForward
if exists('g:Imap_StickyPlaceHolders') && g:Imap_StickyPlaceHolders
  vmap <buffer> <C-J> <Plug>IMAP_JumpForward
else
  vmap <buffer> <C-J> <Plug>IMAP_DeleteAndJumpForward
endif

" Unfold all
set foldlevelstart=99
