## You probably want to be using https://github.com/fatih/vim-go instead


This plugin adds godef support to vim.

The `godef` tool from Roger Peppe parses Go code and returns the location of
the definition of a symbol.  It can be installed with

    go get -v github.com/rogpeppe/godef
    go install -v github.com/rogpeppe/godef

To install the vim-godef plugin, clone this vim-godef repository and (from it) copy `plugin/godef.vim` to `~/.vim/plugin` .

Or, if you're using pathogen, on Linux:

    git clone https://github.com/dgryski/vim-godef ~/.vim/bundle/vim-godef

or on Windows:

    git clone https://github.com/dgryski/vim-godef %USERPROFILE%\vimfiles\bundle\vim-godef

This modules overrides the `gd` (go to local definition) command to open a new
window at the definition of the symbol under the cursor.  Setting

    g:godef_split=0

(that is, entering the command `let g:godef_split=0` or inserting it into your ~/.vimrc)
will reuse the current window, and

    g:godef_split=2

will open the definition in a new tab, and

    g:godef_split=3

will use a vertical split instead of the default horizontal split.

If you want jumps to the same file to move your current cursor instead of splitting, use

    g:godef_same_file_in_same_window=1

This also adds a `:Godef ` which will work for global types, methods,
constants, and variables in the current package.
