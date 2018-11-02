" vimrc: http://vimdoc.sourceforge.net/htmldoc/usr_05.html#vimrc-intro
" vimrc options: http://vimdoc.sourceforge.net/htmldoc/options.html

set ruler " Always display the current cursor position in the lower right corner of the Vim window.
set number  " Display row number
" set cursorline  " Display under line in current line

set showcmd  " Show (partial) command in status line.
set showmatch  " Show matching brackets.
set ignorecase  " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search
set autowrite  " Automatically save before commands like :next and :make
set hidden  " Hide buffers when they are abandoned
set mouse=a  " Enable mouse usage (all modes)

set smarttab  " Insert blanks according to tab settings are used in other places
set tabstop=4  " Number of spaces that a <Tab> in the file counts for.
set softtabstop=4     " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
set shiftwidth=4  " Set the shift width (the number of characters text is moved sideways for the shift command (<< and >>)).
set expandtab " Use the appropriate number of spaces to insert a <Tab>.

set autoindent " Copy indent from current line when starting a new line/
set smartindent " Do smart autoindenting when starting a new line.

set wildmenu " command-line completion operates in an enhanced mode

" filetype on " To enable file type detection
" filetype plugin on  " enable loading the plugin files for specific file types
" filetype indent on  " enable loading the indent file for specific file types
" settings of filetype in one line
filetype plugin indent on

syntax on  # syntax highlight
