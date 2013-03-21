
This plugin adds godef support to vim.

The `godef` tool from Roger Peppe parses Go code and returns the location of
the definition of a symbol.  It can be installed with

    go get -v code.google.com/p/rog-go/exp/cmd/godef
    go install -v code.google.com/p/rog-go/exp/cmd/godef

To install this plugin, copy godef.vim to ~/.vim/plugins.

Or, if you're using pathogen, 

    git clone https://github.com/dgryski/vim-godef ~/.vim/bundle/vim-godef

This modules overrides the `gd` (go to local definition) command to open a new
window at the definition of the symbol under the cursor.  Setting
`g:godef_split` = 0 will reuse the current window instead.

It also adds a `:Godef ` which will work for global types, methods,
constants, and variables in the current package.
