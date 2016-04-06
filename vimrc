" MY VIM RC "
"
" Merged my vimrc with gordin's (https://github.com/Gordin/vimrc) this is the
" result. Setup scripts probably (maybe?) coming when I setup my next PC.
"
"
" PLUGINS:
"
"       airline "
"       tabular "
"       ultisnips "
"       tasklist "
"       gundo "
"       nerdtree
"       ack "
"       YouCompleteMe
"       speeddating
"       abolish
"       i3 syntax
"       git syntax
"       capslock
"       fugitive
"       syntastic
"       Rainbow Parantheses
"       Recover
"       IndentLine
"       DelimitMate
"       Repeat
"       Sleuth
"       NerdCommenter
"       Surround
"       Vim Colors
"       TagBar
"       Easymotion
"       MatchTagAlways and matchit
"       CSV
"       Signify
"       Colorscheme Approximation
"       Ctrl + P
"       rust
"
" UNUSED:
"
"       LaTeX-Box
"       Easyclip
"       Conceal Plugins
"       Session Manager
"       CoffeeScript
"       Tern for Vim
"       pymode
"       ropevim
"       pyflakes
"       pep8
"       supertab


""""""""""
" VUNDLE "
""""""""""

set nocompatible              " be iMproved
filetype off                  " required for vundle

" Do Vundle stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'


" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.


""""""""""""""""""
" PLUGIN SECTION "
""""""""""""""""""

""" Leader """
let mapleader = ","
let maplocalleader = ","

" PLUGIN: airline "
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'Unknown branch'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
"let g:airline_theme="powerlineish"
Plugin 'bling/vim-airline'

" PLUGIN: tabular "
" TODO: fix this if...
"if exists(":Tabularize")
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>
nnoremap <Leader>a{ :Tabularize /{<CR>
vnoremap <Leader>a{ :Tabularize /{<CR>
nnoremap <Leader>a/ :Tabularize /\/\/<CR>
vnoremap <Leader>a/ :Tabularize /\/\/<CR>
nnoremap <Leader>a} :Tabularize /[{}]<CR>
vnoremap <Leader>a} :Tabularize /[{}]<CR>
"single spaces:
nnoremap <Leader>as :Tabularize /\S\+/l1l0<CR>
vnoremap <Leader>as :Tabularize /\S\+/l1l0<CR>
"comma delimited fields
nnoremap <Leader>a, :Tabularize /, *\zs[^ ]/l1l0<CR>
vnoremap <Leader>a, :Tabularize /, *\zs[^ ]/l1l0<CR>
"endif

" call tabularize every time you type '|'
"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
Plugin 'godlygeek/tabular.git'

" PLUGIN: ultisnips "
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine.
Plugin 'honza/vim-snippets'

" PLUGIN: tasklist "
noremap <leader>td <Plug>TaskList
Plugin 'vim-scripts/TaskList.vim.git'

" PLUGIN: gundo "
"nnoremap <F5> :GundoToggle<CR>
"nnoremap <leader>g :GundoToggle<CR>
nnoremap \g :GundoToggle<CR>
"settings (defaults)
"let g:gundo_width = 45
"let g:gundo_preview_height = 15
"let g:gundo_preview_bottom = 0   "move preview window to bottom
"let g:gundo_right = 0            "move undo window to right
"let g:gundo_help = 1             "show help
"let g:undo_disable = 0           "disable for multiuse vimrc
"let g:undo_close_on_revert = 0   "close window on <CR>
Plugin 'sjl/gundo.vim.git'

" PLUGIN: nerdtree
noremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
Plugin 'scrooloose/nerdtree'

" PLUGIN: ack "
nnoremap <leader>Ack <Esc>:Ack!
nnoremap <leader>Aw :Ack! -Ri '<cword>(C'<CR>
Plugin 'mileszs/ack.vim.git'

" PLUGIN: YouCompleteMe
nnoremap <leader>yd :YcmCompleter GoToDefinitionElseDeclaration<cr>
nnoremap <leader>yi :YcmCompleter GoToImplementationElseDeclaration<cr>
let g:ycm_global_ycm_extra_conf='/home/tu500/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:syntastic_always_populate_loc_list=1
"let g:ycm_autoclose_preview_window_after_insertion = 1
Plugin 'Valloric/YouCompleteMe'

" PLUGIN: speeddating
Plugin 'tpope/vim-speeddating.git'

" PLUGIN: abolish
Plugin 'tpope/vim-abolish.git'

" PLUGIN: i3 syntax
Plugin 'PotatoesMaster/i3-vim-syntax'

" PLUGIN: git syntax
Plugin 'tpope/vim-git.git'

" PLUGIN: capslock
" software capslock
Plugin 'tpope/vim-capslock.git'

" PLUGIN: fugitive
command! Gpush Git push
command! Gpull Git pull
Plugin 'tpope/vim-fugitive'

" PLUGIN: syntastic
" syntax checking, linewise error icons
Plugin 'scrooloose/syntastic'

" PLUGIN: Rainbow Parantheses
" color matching parantheses
au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces
Plugin 'kien/rainbow_parentheses.vim'

" PLUGIN: Recover
" better interface when .swp file was found
Plugin 'chrisbra/Recover.vim'

" PLUGIN: IndentLine
" Indent Guides with Conceal
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239
" other lines: ┆ ¦ │
Plugin 'Yggdroot/indentLine'

" PLUGIN: DelimitMate
" automaticall add closing parentheses
" TODO: conflicts with repeat actions
let delimitMate_quotes = "\" ' `"
let delimitMate_matchpairs = "(:),[:],{:}"
Plugin "Raimondi/delimitMate"

" PLUGIN: Repeat
" Make actions of some plugins repeatable
Plugin 'tpope/vim-repeat'

" PLUGIN: Sleuth
" Detects and sets indentation
Plugin 'tpope/vim-sleuth'

" PLUGIN: NerdCommenter
"Plugin 'scrooloose/nerdcommenter'
Plugin 'tomtom/tcomment_vim'

" PLUGIN: Surround
" Surround stuff with braces or XML tags or delete/replace
" ds* delete cs* replace ys* surround
" t as * selects an XML tag
function! DeleteBrackets()
    normal %%
    let c = getline(".")[col(".") - 1]
    execute 'normal ds' . c
endfunction

nnoremap dss :call DeleteBrackets()<CR>
Plugin 'tpope/vim-surround'

" PLUGIN: Vim Colors
" Colorschemes
Plugin 'spf13/vim-colors'

" PLUGIN: TagBar
nnoremap <leader>tb :TagbarToggle<CR>
Plugin 'majutsushi/tagbar'

" PLUGIN: Easymotion
"let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_leader_key = '<Leader><Leader>'
"let g:EasyMotion_smartcase = 1
Plugin 'Lokaltog/vim-easymotion'

" PLUGIN: MatchTagAlways and matchit
" This highlights enclosing/matching tags in HTML and XML
Plugin 'Valloric/MatchTagAlways'
" This allows % to jump between open and closing tags
Plugin 'matchit.zip'

" PLUGIN: CSV
Plugin 'chrisbra/csv.vim'

" PLUGIN: Signify
" symbols for modified, added, deleted lines (version control)
Plugin 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
" Colors for Signify symbols are defined in CSApprox_hook_post

" PLUGIN: Colorscheme Approximation
" This transforms colorschemes to terminal colorschemes
" The ctermbg=NONE hooks make backgrounds transparent in terminals
Plugin 'godlygeek/csapprox'
let g:CSApprox_hook_post = [
            \ 'highlight Normal ctermbg=NONE ctermfg=NONE',
            \ 'highlight LineNr ctermbg=NONE ctermfg=NONE',
            \ 'highlight SignifyLineAdd    cterm=bold ctermbg=NONE ctermfg=green',
            \ 'highlight SignifyLineDelete cterm=bold ctermbg=NONE ctermfg=red',
            \ 'highlight SignifyLineChange cterm=bold ctermbg=NONE ctermfg=yellow',
            \ 'highlight SignifySignAdd    cterm=bold ctermbg=NONE ctermfg=green',
            \ 'highlight SignifySignDelete cterm=bold ctermbg=NONE ctermfg=red',
            \ 'highlight SignifySignChange cterm=bold ctermbg=NONE ctermfg=yellow',
            \ 'highlight SignColumn        ctermbg=NONE',
            \ 'highlight NonText ctermbg=NONE ctermfg=NONE',
            \ 'highlight clear LineNr'
            \]

" PLUGIN: Ctrl + P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <c-a-p> :CtrlPMixed<CR>
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
\ 'file': '\.exe$\|\.so$\|\.dat$'
\ }
Plugin 'kien/ctrlp.vim'

" PLUGIN: Rust support
Plugin 'rust-lang/rust.vim'


""""""""""""""""""
" UNUSED PLUGINS "
""""""""""""""""""

" PLUGIN: LaTeX-Box
"let g:LatexBox_latexmk_async = 1
"let g:LatexBox_latexmk_preview_continuously = 1
"let g:LatexBox_quickfix = 2
"let g:LatexBox_latexmk_options = '-lualatex'
"let g:LatexBox_Folding = 1
"Plugin 'LaTeX-Box-Team/LaTeX-Box'

" PLUGIN: Easyclip
" Delete commands don't yank any more
" visual paste does not yank any more
" new "m" command
"Plugin 'svermeulen/vim-easyclip'

" PLUGIN: Conceal Plugins
"Plugin 'tyok/js-mask'
"Plugin 'ehamberg/vim-cute-python'

" PLUGIN: Session Manager
"Plugin 'vim-scripts/sessionman.vim'

" PLUGIN: CoffeeScript
"Plugin 'kchmck/vim-coffee-script'

" PLUGIN: Tern for Vim
" javascript editing
"Plugin 'marijnh/tern_for_vim'

" LEGACY:

" PLUGIN: pymode
" turn off some annoying linters ;)
"let g:pymode_lint_checker = "pyflakes"

" PLUGIN: ropevim
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

" PLUGIN: pyflakes
"let g:pyflakes_use_quickfix = 0

" PLUGIN: pep8
"let g:pep8_map='<leader>8' " outsource to filetype?

" PLUGIN: supertab
"au FileType python set omnifunc=pythoncomplete#Complete "outsourced to ft
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview


"""""""""""""""
" MAIN CONFIG "
"""""""""""""""

syntax on
filetype plugin indent on

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent


""" Stuff you don't notice """
set encoding=utf-8      " standard encoding is utf-8
scriptencoding utf-8

if !has('nvim')
  if !has('gui')
      set term=$TERM      " Make arrow and other keys work
  endif
endif

""" Leader """
let mapleader = ","
let maplocalleader = ","

""" Spellchecking """
set spelllang=de_20,en          " german and english spellchecking
set nospell                     " disable spellchecking on startup


""" Folding """
set foldlevelstart=99           " start with all folds open
set foldmethod=indent           " Fold automatically based on indentation level


""" Looks """
set t_Co=256                    " Tell vim that our Terminal has 256 Colors
set background=dark             " Tell vim that our background is dark
"colorscheme molokai             " Select cholorscheme
set noshowmode                  " Hide the mode text as airline already shows this
"set showcmd                     " Show partially entered commands in the statusline

syntax on                       " Syntax highlighting
set number                      " Show line numbers
set ruler                       " Show the line and column number of the cursor position,
set cc=101                       " visual bar at 101th column
"set cursorline                  " Highlight the line with the cursor
"set mousehide                   " Hide the mouse cursor while typing (works only in gvim?)
"set scrolloff=10                " Always have 10 lines at the top/bottom above/below cursor

"set showmatch                   " Highlight matching brackets when a pair is closed


" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Disable tex conceal
" A broken, new feature that just happened to be activated by default upon an
" update and which you can't find anything about unless you know what you are
" looking for.
" Did anybody ever test it? I mean, beyond checking if it `looks` right?
let g:tex_conceal = ""


""" History, Backup, undo """
set history=10000

set backup                      " Enable backups ...
set backupdir=~/.vim/tmp/backup " set directory for backups

" Don't backup files in temp directories
set backupskip=/tmp/*,/private/tmp/*,~/.vim/tmp/,~/tmp/"

if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undodir=~/.vim/tmp/undo " undo files
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

set directory=~/.vim/tmp/swap   " set directory for swap files


""" Behaviour """
set autoindent          " automatically indent stuff
set smartindent         " Do autoindenting based on systax
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set matchpairs+=<:>     " Match, to be used with %

"set mouse=a             " Automatically enable mouse usage
set mouse=               " Automatically enable mouse usage
set hidden              " allow to switch buffers without saving

set wildmenu            " Completion for :Ex mode. Show list instead of just completing
set wildmode=longest:full,full       " Command <Tab> completion, Show all matches, cycle through with <tab>
set wildchar=<tab>      " Make sure Tab starts wildmode
set wildignorecase      " ignore case in wildmode
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" parse .vimrc in current directory
set exrc

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

set gdefault            " substitutions have the g (all matches) flag by default. Add g to turn off

"" Searching ""
set ignorecase          " Ignore case while searching
set smartcase           " Be case sensitive when capital letters are used
"set incsearch           " start searching while typing
set hlsearch


""""""""""""
" MAPPINGS "
""""""""""""

"let mapleader=','

noremap <TAB> <C-^>

set pastetoggle=<F2>

" I like these mappings more than changing the keyboard layout, as it allows
" to type `rö` etc. when you need it once.
map ö [
map ä ]
map Ö {
map Ä }
map ü @
map Ü \
map ° ~
imap ö [
imap ä ]
imap Ö {
imap Ä }
imap ü @
imap Ü \
imap ° ~

function! UnmapUmlaute()
  "if mapcheck('ö', 'i')
    iunmap ö
    iunmap ä
    iunmap Ö
    iunmap Ä
    iunmap ü
    iunmap Ü
    iunmap °
  "endif
endfunc


" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap


"bind window movements to ctrl-move
"noremap <c-j> <c-w>j
"noremap <c-k> <c-w>k
"noremap <c-l> <c-w>l
"noremap <c-h> <c-w>h

" stuff for moving around wrapped lines
"vmap <D-j> gj
"vmap <D-k> gk
"vmap <D-4> g$
"vmap <D-6> g^
"vmap <D-0> g^
"nmap <D-j> gj
"nmap <D-k> gk
"nmap <D-4> g$
"nmap <D-6> g^
"nmap <D-0> g^


" Use dp and do only on selected lines
vnoremap dp :diffput<CR>:diffupdate<CR>
vnoremap do :diffget<CR>:diffupdate<CR>

" use p/P in visual mode to replace with paste storage
vnoremap p "_dp
vnoremap P "_dP

" leader-d/D for deleting without pasting
nnoremap <leader>d "_d
nnoremap <leader>D "_D
vnoremap <leader>d "_d
vnoremap <leader>D "_D


" documentation editing
" make doc
nnoremap <leader>md :helptags ~/.vim/doc<cr>


" make projects
"  save, make, open quickfix window
nnoremap <leader>mm :w<cr>:make<cr><cr><cr>:cope<cr>


" Shortcut to rapidly toggle `set list`
nnoremap <leader>li :set list!<CR>

" Remove trailing whitespace (see below)
nnoremap <silent> <leader>sw :call <SID>StripTrailingWhitespaces()<CR>


" toggle spellchecking
nnoremap <silent> <leader>sp :set spell!<CR>


" open files from directory of current file (not working directory)
" also able to use %% for directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za


" Faster Esc
inoremap jk <esc>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>. :lcd %:h<CR>

" Write a readonly-opened file
cnoremap w!! w !sudo tee % >/dev/null


"" Searching ""

" Toggle search-highlights with <leader>/
nmap <silent> <leader>/ :set invhlsearch<CR>

" Automatically turn hlsearch on again when you search or go through results
nnoremap / :set hlsearch<CR>/
nnoremap ? :set hlsearch<CR>/
nnoremap <silent> n :set hlsearch<CR>n
nnoremap <silent> N :set hlsearch<CR>N

" Stay on the selected word when selecting a word with * or # to search for
nnoremap <silent> * :call SavePos()<CR>:set hlsearch<CR>*:call RestorePos()<CR>
nnoremap <silent> g* :call SavePos()<CR>:set hlsearch<CR>g*:call RestorePos()<CR>
nnoremap <silent> # :call SavePos()<CR>:set hlsearch<CR>#:call RestorePos()<CR>
nnoremap <silent> g# :call SavePos()<CR>:set hlsearch<CR>g#:call RestorePos()<CR>

" In visual mode press * or # to search for the current selection
" selections will be found inside other words, even if a whole word is selected
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Substitute
nnoremap <leader>S :%s/


"""""""""""""
" SCRIPLETS "
"""""""""""""

" Diff current buffer against currently saved version of the file
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" Source the vimrc file after saving it
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
  autocmd! bufwritepost .vimrc :CSApprox
  autocmd! bufwritepost vimrc source $MYVIMRC
  autocmd! bufwritepost vimrc :CSApprox
endif
" Edit vimrc and expand symlinks to the actual folder
nnoremap <leader>vimrc :e <C-r>=resolve(expand("~/.vimrc"))<CR><CR>


"" This beauty remembers where you were the last time you edited the file, and returns to the same position.
" Unneeded, native support
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


" enables django template snippets in html files
" TODO: maybe want to separate it (project directories?)
au BufRead,BufNewFile *.html set filetype=htmldjango


" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])


""""""""""""""""""""
" OTHER STUFF HERE "
""""""""""""""""""""

" setting for some filetypes

autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml

" Make sure all mardown files have the correct filetype set and setup wrapping
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set filetype=markdown

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json set ft=javascript

" use :Wrap for better wrapping
command! -nargs=* Wrap set wrap linebreak


" used with  ':Stab'
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction


" Remove trailing whitespace
" autocall, when saving a file:
"   autocmd BufWritePre *.py,*.js,*.c,*.cpp,*.hpp,*.h :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction


" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! SavePos()
    " Save the current cursor position
    let g:save_cursor = getpos(".")
    " Save the window position
    set lazyredraw
    normal !H
    let g:save_window = getpos(".")
    call setpos('.', g:save_cursor)
endfunction

function! RestorePos()
    " Restore the window position
    call setpos('.', g:save_window)
    normal zt
    " Restore the cursor position
    call setpos('.', g:save_cursor)
    set nolazyredraw
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
