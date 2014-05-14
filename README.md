
This plugin adds godef support to vim.

The `godef` tool from Roger Peppe parses Go code and returns the location of
the definition of a symbol.  It can be installed with

    go get -v code.google.com/p/rog-go/exp/cmd/godef
    go install -v code.google.com/p/rog-go/exp/cmd/godef

To install this plugin, clone this repository and (from it) copy `plugin/godef.vim` to `~/.vim/plugin` .

Or, if you're using pathogen, 

    git clone https://github.com/dgryski/vim-godef ~/.vim/bundle/vim-godef

This modules overrides the `gd` (go to local definition) command to open a new
window at the definition of the symbol under the cursor.  Setting

    g:godef_split=0

will reuse the current window, and

    g:godef_split=2

will open the definition in a new tab, and

    g:godef_split=3

will use a vertical split instead of the default horizontal split.

If you want jumps to the same file to move your current cursor instead of splitting, use

    g:godef_same_file_in_same_window=1

This also adds a `:Godef ` which will work for global types, methods,
constants, and variables in the current package.
