"----------------
" Name          : .vimrc
" Description   : VIM configuration file
" Author        : E Fournier
" Dependencies  : vim
"----------------

" System

"" Syntax

""" Highlight the selected line
set cursorline

""" Detect and adjust for file type
filetype plugin indent on

"" Compatibility

""" Disable Vi compatibility
set nocompatible

"" Files

""" Detect changes to open files
set autoread

"" Privacy

""" Disable swap files
set noswapfile

""" Disable persistent undo files (OFF by default)
set noundofile

""" Disable vim-info file
set viminfofile=NONE

""" Encryption method
set cm=blowfish2

"" Format

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

"" Search and Find

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

""" Find recursively from base directory
set path+=**

""" Show menu of found items on <Tab>
set wildmenu

""" Count highlighted results
nnoremap <leader>ch :%s///gn<CR>

" Interface

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

"" Completion

""" Order of auto-complete options for <ctrl-n> menu
set complete=.,w,b,u,t,k

"" Graphical Vim Tweaks

""" Font
set guifont=Hack

""" Hide the menubar
set guioptions -=m

""" Hide the toolbar
set guioptions -=T

"" Spelling

""" Dictionary

"""" Include dictionary words file
set dictionary+=$VVIM/dict/words

"""" Underline misspelled words
hi! SpellBad cterm=underline ctermbg=none ctermfg=none

""" Auto Enable Spell Checking for File Types

"""" Text files
autocmd BufRead,BufNewFile *.txt setlocal spell

"""" Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

"""" File with no an extension
autocmd BufRead,BufNewFile * if expand('%:t') !~ '\.' | setlocal spell | endif

" Shortcuts

"" Leader Key
let mapleader = '\'

"" Tabs

""" Create a new tab
nnoremap <silent> <C-W>t :tabnew<CR>

"" Spelling

""" Toggle spell checking in the current buffer
nmap <Leader>s :setlocal spell! spelllang=en_gb<CR>

""" Globally search for the word under the cursor
nmap <Leader>vg :vimgrep <C-R>=expand('<cword>')<CR> **/* <CR> :cw <CR>"

"" Font

""" Open font-picker menu for graphical vim
nnoremap <leader>f :set guifont=*<CR>

"" Formatting

""" Format JSON
nnoremap <leader>json :%!python -m json.tool<CR>

"""" Command Mapping
noremap <Leader>q :call ReplaceCurlyQuotes()<CR>

"" Encoding

""" Base64

"""" Encode
vnoremap <leader>e64 :'<,'>!python -m base64 -e<CR>

"""" Decode
vnoremap <leader>d64 :'<,'>!python -m base64 -d<CR>

"" Directories

""" Change PWD to directory of the current buffer
nnoremap <leader>cd :cd %:p:h<CR>

"" HTML

""" Create tag
noremap <Leader>hcl I<!-- <ESC>A --><ESC>

""" Comment line
noremap <Leader>hcl I<!-- <ESC>A --><ESC>

""" Uncomment line
noremap <Leader>hul ^df <ESC>$F D

""" Comment tag
noremap <Leader>hct vat<ESC>`<I<!--<ESC>`>A--><ESC>

""" Uncomment tag
noremap <Leader>hut vat<ESC>`<^xxxx`>$xxx<ESC>

" Locally (local to block) rename a variable
nmap <Leader>rn :%s/<C-R><C-W>/<C-R><C-W>/g<left><left>

noremap <Leader>ph :!tidy -mi -xml -wrap 0 %<CR>

"" Snippets

""" HTML skeleton
noremap <Leader>html :-1read $VSNIPS/html_skeleton.html<CR>5jf>a

""" shUnit test
noremap <Leader>btest :-1read $VSNIPS/bash_shunit_test.bash<CR>ea

""" Bash header
noremap <Leader>bhead :-1read $VSNIPS/bash_header.bash<CR>ea

""" Bash null check
noremap <Leader>bnull :-1read $VSNIPS/bash_nullcheck.bash<CR>ea

"" Functions

""" Replace curly quotes with straight quotes
function! ReplaceCurlyQuotes()
  silent! %s/“/"/g
  silent! %s/”/"/g
  silent! %s/’/'/g
  silent! %s/‘/'/g
  let @/ = ""
endfunction

""" Search for a pattern and open results in the quickfix menu
function Xgrep()
  call inputsave()
  let pattern = input('find: ')
  call inputrestore()
  execute 'vimgrep /' . pattern . '/g *'
  copen
  resize 20
  let @/ = pattern
  normal n
endfunction

" Plugins

"" Vim-Plug

""" Automatically install the plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

""" Register Plugins
call plug#begin()
  Plug 'airblade/vim-gitgutter'
  Plug 'andymass/vim-matchup'
  Plug 'brooth/far.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'gabrielelana/vim-markdown'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'ngmy/vim-rubocop'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-rails'
  Plug 'thoughtbot/vim-rspec'
  Plug 'yegappan/taglist'
call plug#end()

"" File Trees

""" NERDtree

"""" Fix menu height
set cmdheight=1

"""" Toggle file tree
nnoremap <silent> <Leader>et :NERDTreeToggle<cr>
nnoremap <silent> <Leader>ef :NERDTreeFind<cr>

""" Netrw

"""" Hide banner
let g:netrw_banner = 0

"""" List files without expandable directories
let g:netrw_liststyle = 3

"""" Prevent history file creation
let g:netrw_dirhistmax = 0

"" Fugitive | Version Control

""" Display all dirty files
nnoremap <silent> <Leader>gg :Git<cr>

""" Display a vertical diff for the current buffer
nnoremap <silent> <Leader>gd :Gvdiff<cr>

""" Open merge tool to resolve conflicts in the active file
nnoremap <silent> <Leader>gm :Gvdiffsplit!<cr>

""" While Merging | take left change
nnoremap <silent> <Leader>gl :diffget //2<cr>

""" When Merging | take right change
nnoremap <silent> <Leader>gr :diffget //3<cr>

""" Push commited changes
nnoremap <silent> <Leader>gp :G push<cr>

"" FAR | Find and Replace

""" Replace a pattern across the current directory
nmap <Leader>ra :Far <C-R><C-W>/<C-R><C-W>/g<left><left>

"" FZF

""" Files
nnoremap <silent> <C-P> :GFiles<CR>

""" Tags
nnoremap <silent> <C-T> :call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <silent> <C-T><C-T> :Tags<CR>

""" Buffers
nnoremap <silent> <C-B> :Buffers<CR>

""" History
nnoremap <silent> <C-H> :History<CR>

""" Find
nnoremap <silent> <C-S> :call fzf#vim#ag(expand('<cword>', '--word-regexp'))<CR>
nnoremap <silent> <C-F> :Ag<CR>

""" Search encrypted files
nmap <leader>x :call Xgrep()<CR>

"" RSpec.vim
map <Leader>tc :call RunNearestSpec()<CR>
map <Leader>tl :call RunLastSpec()<CR>
map <Leader>tf :call RunCurrentSpecFile()<CR>
map <Leader>ta :call RunAllSpecs()<CR>

"" Rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>rs :RuboCop<CR>
nmap <Leader>rf :RuboCop -A<CR>

"" Bookmarks
let g:bookmark_auto_save_file = $VVIM .'/bookmarks'
nmap <Leader>bb <Plug>BookmarkToggle
nmap <Leader>bs <Plug>BookmarkShowAll
nmap <Leader>bn <Plug>BookmarkNext
nmap <Leader>bp <Plug>BookmarkPrev
nmap <Leader>bc <Plug>BookmarkClearAll

