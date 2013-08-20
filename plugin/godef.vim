" needs https://code.google.com/p/rog-go/source/browse/exp/cmd/godef/godef.go

if !exists("g:godef_command")
    let g:godef_command = "godef"
endif

if !exists("g:godef_split")
    let g:godef_split = 1
endif

let g:godef_newtab = get(g:, 'godef_newtab', 0)

function! GodefUnderCursor()
    let offs=line2byte(line('.'))+col('.')-1
    call Godef("-o=" . offs)
endfunction

function! Godef(arg)

    if &modified
        " XXX not ideal, but I couldn't find a good way
        "     to create a temporary buffer for use with
        "     a filter
        let filename=tempname()
        echomsg filename
        execute ":write " . filename
    else
        let filename=bufname("%")
    endif

    let out=system(g:godef_command . " -f=" . filename . " " . a:arg)

    if out =~ 'godef: '
        let out=substitute(out, '\n$', '', '')
        echom out
    else
        if g:godef_split
            split
        elseif g:godef_newtab
            tabnew
        endif
        lexpr out
    end
endfunction

autocmd FileType go nnoremap <buffer> gd :call GodefUnderCursor()<cr>
command! -range -nargs=1 Godef :call Godef(<q-args>)
