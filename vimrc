"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/carmen/code/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/carmen/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('easymotion/vim-easymotion')
call dein#add('fntlnz/atags.vim')
call dein#add('vim-scripts/taglist.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('xolox/vim-misc') " Required for xolox plugins
call dein#add('xolox/vim-session')
call dein#add('tpope/vim-unimpaired')
call dein#add('godlygeek/tabular')
call dein#add('sjl/gundo.vim')
" call dein#add('simnalamburt/vim-mundo')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

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
map <Leader>t :call atags#generate()<cr>
" Generate tags whenever a file is being writte
" autocmd BufWritePost * call atags#generate()

" Configure TList
let Tlist_GainFocus_On_ToggleOpen = 1
map <Leader>q :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Close_On_Select = 1

" fugitive bindings
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>

" toggle US spelling with leader s
set spelllang=en_us
nmap <silent> <leader>s :set spell!<CR>

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

if has("autocmd")
	augroup reload_vimrc " {
		autocmd!
		" Every symbolic link needs to be seperately added here
		autocmd bufwritepost vimrc source $MYVIMRC
		autocmd bufwritepost $MYVIMRC source $MYVIMRC
	augroup END " }
endif

nmap <Leader>v :tabedit $MYVIMRC<CR>

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
" set undofile
" set undodir=~/.vim/undo


