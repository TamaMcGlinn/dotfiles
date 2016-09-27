" github.com/brooth/scroll_mode.vim

function! ToogleScrollMode()
    if exists("s:scroll_mode")
        unmap k
        unmap j
        unlet s:scroll_mode
	echom "scroll mode off"
    else
        nnoremap j <C-e>j
        nnoremap k <C-y>k
        let s:scroll_mode = 1 
	echom "scroll mode on"
    endif
endfunction
