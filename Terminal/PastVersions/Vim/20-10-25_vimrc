" SYSTEM

filetype plugin indent on
set cursorline

"" Compatibility

""" Disable Vi compatibility
set nocompatible

"" Clipboard

""" Enable access to the system clipboard
set clipboard=unnamed

"" Files

""" Detect changes to open files
set autoread

"" Privacy

""" Disable swap files
set noswapfile

""" Disable persistent undo files
set noundofile

""" Encryption method
set cm=blowfish2

"" Fuzzy Find

""" Find recursively from base directory
set path+=**

""" Show menu of found items on <Tab>
set wildmenu

" INTERFACE

"" Layout

""" Show line numbers on left of screen
set number

""" Display keystrokes while typing commands
set showcmd

""" Always show the status line
set laststatus=2

""" Enable faster redrawing
set ttyfast

""" Disable the welcome message
set shortmess+=I

"" Colors

""" Global color scheme (from $HOME/.vim/colors)
colorscheme hybrid_material

""" Background color
set background=dark

""" Enable 256 colorspace support
set t_Co=256

""" Enable syntax coloring
syntax on

""" Highlight corresponding braces
set showmatch

"" Bell

""" Disable audible and visual bell
set belloff=all

"" Indentation

""" Copy indent level when inserting a new line
set autoindent

""" Auto-indent when inserting a new line
set smartindent

"" Backspace

""" Fix backspace functionality
set backspace=indent,eol,start

" SPELLING

"" Dictionary

""" Include dictionary words file
set dictionary+=$HOME/.vim/dict/words

""" Underline misspelled words
hi! SpellBad cterm=underline ctermbg=none ctermfg=none

"" Auto Enable Spell Checking for File Types

""" Text files
autocmd BufRead,BufNewFile *.txt setlocal spell

""" Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

""" File with no an extension
autocmd BufRead,BufNewFile * if expand('%:t') !~ '\.' | setlocal spell | endif

"" Indentation

""" Convert tabs into spaces
set smarttab

""" Spaces per <Tab>
set tabstop=2

""" Use appropriate number of spaces on <Tab> in Insert and Visual modes
set expandtab

""" Spaces per <Tab> when performing editing operations
set softtabstop=2

""" Space for auto indentation
set shiftwidth=2

""" Round indents to a multiple of $shiftwidth
set shiftround

"" Search

""" Ignore case when search contains only lowercase letters
set ignorecase

""" Use case when search contains a capital letter
set smartcase

""" Highlight search matches
set hlsearch

""" Search incrementally while typing
set incsearch

""" Enable searching with regex expressions
set magic

" GRAPHICAL VIM

"" When Using gVim
if has('gui_running')

  """ Font
  set guifont=Consolas:h14

  """ Hide the menubar
  set guioptions -=m

  """ Hide the toolbar
  set guioptions -=T

endif

" SHORTCUTS

"" leader Key
let mapleader = '\'

"" Tabs

""" Create a new tab
nnoremap <silent> <C-W>t :tabnew<CR>

"" Spelling

""" Toggle spell checking in the current buffer
nmap <Leader>s :setlocal spell! spelllang=en_gb<CR>

""" 
nmap <Leader>g :vimgrep <C-R>=expand('<cword>')<CR> **/* <CR> :cw <CR>"

"" Snippets

""" HTML Skeleton
noremap <Leader>html :-1read $HOME/.vim/snippets/html_skeleton.html<CR>5jf>a

""" HTML Comment Line
noremap <Leader>hcl I<!-- <ESC>A --><ESC>

""" HTML Uncomment Line
noremap <Leader>hucl ^df <ESC>$F D

""" shUnit Test
noremap <Leader>btest :-1read $HOME/.vim/snippets/bash_shunit_test.bash<CR>ea

""" Bash Header
noremap <Leader>bhead :-1read $HOME/.vim/snippets/bash_header.bash<CR>ea

""" Bash Null Check
noremap <Leader>bnull :-1read $HOME/.vim/snippets/bash_nullcheck.bash<CR>ea

set complete=.,w,b,u,t,i,k

