" vimrc: http://vimdoc.sourceforge.net/htmldoc/usr_05.html#vimrc-intro
" vimrc options: http://vimdoc.sourceforge.net/htmldoc/options.html

" When Vim finds a vimrc, 'nocompatible' is set anyway.
" We can still set it explicitely to make our position clear.
set nocompatible

" set encoding=utf8
set ruler       " Always display the current cursor position in the lower right corner of the Vim window.
set number      " Display row number
" set backspace=indent,eol,start  " Make backspace work as you would expect.

set showmode    " Show current mode in command-line.
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
" set cursorline  " Display under line in current line
" set nowrap      " Do not wrap line

set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set hidden      " Hide buffers when they are abandoned
set mouse=a     " Enable mouse usage (all modes)
set wildmenu    " command-line completion operates in an enhanced mode

set incsearch   " Incremental search. Highlight while searching with / or ?.
set hlsearch    " Keep matches highlighted.

set ttyfast     " Faster redrawing.
set lazyredraw  " Only redraw when necessary.
set autowrite   " Automatically save before commands like :next and :make
set autoread    " Set to auto read when a file is changed from the outside
set noswapfile  " Don't use swapfile

set smarttab       " Insert blanks according to tab settings are used in other places
set tabstop=4      " Number of spaces that a <Tab> in the file counts for.
set softtabstop=4  " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
set shiftwidth=4   " Set the shift width (the number of characters text is moved sideways for the shift command (<< and >>)).
set expandtab      " Use the appropriate number of spaces to insert a <Tab>.
set shiftround     " <Tab>(>>) indents to next multiple of 'shiftwidth'.

set autoindent     " Copy indent from current line when starting a new line/
set smartindent    " Do smart autoindenting when starting a new line.

" filetype on         " To enable file type detection
" filetype plugin on  " enable loading the plugin files for specific file types
" filetype indent on  " enable loading the indent file for specific file types
" settings of filetype in one line
filetype plugin indent on

syntax on  " Enable syntax highlighting

set list  " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
    let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Move selection up/down (add =gv to reindent after move)
" https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <C-S-Up> :m-2<CR>==
nnoremap <C-S-Down> :m+<CR>==
inoremap <C-S-Up> <Esc>:m-2<CR>==gi
inoremap <C-S-Down> <Esc>:m+<CR>==gi
vnoremap <C-S-Up> :m-2<CR>gv=gv
vnoremap <C-S-Down> :m'>+<CR>gv=gv

" share clipboard with system in macOS
" let mapleader=";"
" vmap <Leader>y :w !pbcopy<CR><CR>
" nmap <Leader>y :w !pbcopy<CR><CR>
" nmap <Leader>p :r !pbpaste<CR><CR>
