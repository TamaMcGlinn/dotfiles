" dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/code/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/code/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('machakann/vim-highlightedyank')
call dein#add('osyo-manga/vim-marching')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('vim-scripts/YankRing.vim')
call dein#add('nacitar/a.vim')
call dein#add('easymotion/vim-easymotion')
call dein#add('fntlnz/atags.vim')
call dein#add('vim-scripts/taglist.vim')
call dein#add('steffanc/cscopemaps.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('xolox/vim-misc') " Required for xolox plugins
call dein#add('xolox/vim-session')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-abolish')
call dein#add('godlygeek/tabular')
call dein#add('sjl/gundo.vim')
call dein#add('neomake/neomake')
call dein#add('airblade/vim-gitgutter')
call dein#add('chrisbra/Recover.vim')
call dein#add('nelstrom/vim-markdown-folding')
call dein#add('rhysd/conflict-marker.vim')
call dein#add('vim-scripts/mru.vim')
call dein#add('tpope/vim-ragtag')
call dein#add('jlanzarotta/bufexplorer') " Obsolete? I use F4 mapped to MRU
call dein#add('sjl/gundo.vim')
"inoremap <M-o>       <Esc>o
"inoremap <C-j>       <Down>
"let g:ragtag_global_maps = 1
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-speeddating')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('jreybert/vimagit')
source /usr/share/vim/vim74/macros/matchit.vim

" Required:
call dein#end()

let dein#enable_notification = 1

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>

nnoremap <silent> <F4> :MRU<cr>

nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>
let g:highlightedyank_highlight_duration = 220
"fix for yankring and neovim
let g:yankring_clipboard_monitor=0

" Use visual bell (no beeping)
set visualbell

" Relative line numbers for all but the current line (absolute)
set number
set relativenumber
" just one character wide
set numberwidth=1
" grey for all lines but current, which is white
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermfg=white

let mapleader = " "
" Generate tags (fntlnz/atags) with Leader t
nmap <Leader>t :call atags#generate()<cr>
" Generate tags whenever a file is being writte
" autocmd BufWritePost * call atags#generate()

" Configure TList
let Tlist_GainFocus_On_ToggleOpen = 1
nmap <Leader>q :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Close_On_Select = 1

" fugitive bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>

" toggle US spelling with leader s
set spelllang=en_us
nmap <silent> <leader>s :set spell!<CR>

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" reload vimrc file on write
if has("autocmd")
	" when we reload this vimrc file, that would add an additional 'reload self'
	" command to the bufwrite event, so if you kept saving your vimrc you would
	" get an exponentially slower editor - augroup means it only does it once
	augroup reload_vimrc " {
		autocmd!
		" Every symbolic link needs to be seperately added here
		autocmd bufwritepost vimrc source $MYVIMRC
		autocmd bufwritepost $MYVIMRC source $MYVIMRC
	augroup END " }
endif

nmap <Leader>vv :tabedit $MYVIMRC<CR>
nmap <Leader>vg :tabedit ~/.gitconfig<CR> " Unsolved problem; if that's a symbolic link you can't use Magit or fugitive on the pointed-to file

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

set background=dark

" Open an undo tree with <F5>; <F5> again to close it.
nnoremap <F5> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1
set undodir=~/.vim/undo
set undofile

nnoremap <leader>m :Neomake!<CR>

" quit: F2 - Control means "without saving", Shift means "all buffers"
inoremap <F2> <ESC>:wq<CR>
nnoremap <F2> :wq<CR>
inoremap <F14> <ESC>:wall<CR>:qall<CR> " F14 is S-F2
nnoremap <F14> :wall<CR>:qall<CR>
inoremap <C-F2> <ESC>:q!<CR>
nnoremap <C-F2> :q!<CR>
inoremap <C-S-F2> <ESC>:qall!<CR>
nnoremap <C-S-F2> :qall!<CR>

nnoremap <leader>l :SaveSession<CR>
nnoremap <leader>tc :tabclose<CR>

set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

:let g:session_autosave = 'no'

nnoremap <leader>d :nohl<CR>zz " After searching I kept being confused that I couldn't directly edit - d stands for "done searching"

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>fe  :call SelectaCommand("ionice -c3 find * -type f -name \"*.cpp\" -or -name \"*.h\"", "", ":e")<cr>
nnoremap <leader>fv  :call SelectaCommand("ionice -c3 find * -type f -name \"*.cpp\" -or -name \"*.h\"", "", ":vsp")<cr>
nnoremap <leader>fs  :call SelectaCommand("ionice -c3 find * -type f -name \"*.cpp\" -or -name \"*.h\"", "", ":sp")<cr>
nnoremap <leader>ft  :call SelectaCommand("ionice -c3 find * -type f -name \"*.cpp\" -or -name \"*.h\"", "", ":tabe")<cr>
nnoremap <leader>fae :call SelectaCommand("ionice -c3 find * -type f", "", ":e")<cr>
nnoremap <leader>fav :call SelectaCommand("ionice -c3 find * -type f", "", ":vsp")<cr>
nnoremap <leader>fas :call SelectaCommand("ionice -c3 find * -type f", "", ":sp")<cr>
nnoremap <leader>fat :call SelectaCommand("ionice -c3 find * -type f", "", ":tabe")<cr>
nnoremap <leader>fse :call SelectaCommand("ionice -c3 find * -type f -name \"*.cpp\"", "", ":e")<cr>
nnoremap <leader>fsv :call SelectaCommand("ionice -c3 find * -type f -name \"*.cpp\"", "", ":vsp")<cr>
nnoremap <leader>fss :call SelectaCommand("ionice -c3 find * -type f -name \"*.cpp\"", "", ":sp")<cr>
nnoremap <leader>fst :call SelectaCommand("ionice -c3 find * -type f -name \"*.cpp\"", "", ":tabe")<cr>
nnoremap <leader>fhe :call SelectaCommand("ionice -c3 find * -type f -name \"*.h\"", "", ":e")<cr>
nnoremap <leader>fhv :call SelectaCommand("ionice -c3 find * -type f -name \"*.h\"", "", ":vsp")<cr>
nnoremap <leader>fhs :call SelectaCommand("ionice -c3 find * -type f -name \"*.h\"", "", ":sp")<cr>
nnoremap <leader>fht :call SelectaCommand("ionice -c3 find * -type f -name \"*.h\"", "", ":tabe")<cr>

nnoremap <leader>b :BufExplorer<CR>

" same bindings for merging diffs as in normal mode
xnoremap dp :diffput<cr>
xnoremap do :diffget<cr>

let g:neomake_verbose=3
let g:neomake_logfile='/tmp/error.log'

nnoremap <leader>cc :!clang++ -Wall -std=c++1z %<CR>
nnoremap <leader>cr :!./a.out<CR>
