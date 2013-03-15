" needs https://code.google.com/p/rog-go/source/browse/exp/cmd/godef/godef.go

if !exists("g:godef_command")
    let g:godef_command = "godef"
endif

function! GodefUnderCursor()
    let offs=line2byte(line('.'))+col('.')
    let out=system(g:godef_command . " -f=" . bufname("%") . " -o=" . offs)
    if out =~ 'godef: '
        let out=substitute(out, '\n$', '', '')
        echom out
    else
        split
        lexpr out
    end
endfunction

nnoremap <buffer> <localleader>d :call GodefUnderCursor()<cr>
