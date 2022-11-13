"----------------
" Name          : .vimrc
" Description   : Main VIM configuration file
" Author        : E Fournier
" Dependencies  : vim
"----------------

" System

filetype plugin indent on
set cursorline

"" Plugins

""" Automatically install vim-plug manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdtree'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'brooth/far.vim'
  Plug 'andymass/vim-matchup'
  Plug 'yegappan/taglist'
call plug#end()

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

"" File tree

""" Fix NERDtree menu
set cmdheight=1

"" Fuzzy Find

""" Find recursively from base directory
set path+=**

""" Show menu of found items on <Tab>
set wildmenu

""" FZF

"""" Files
nnoremap <silent> <C-P> :GFiles<CR>

"""" Tags
nnoremap <silent> <C-T> :call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <silent> <C-T><C-T> :Tags<CR>

"""" Buffers
nnoremap <silent> <C-B> :Buffers<CR>

"""" History
nnoremap <silent> <C-H> :History<CR>

"""" Find
nnoremap <silent> <C-F> :call fzf#vim#ag(expand('<cword>', '--word-regexp'))<CR>
nnoremap <silent> <C-F><C-F> :Ag<CR>

""" Vimgrep

"""" Search for a pattern and open results in the quickfix menu
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

"""" Search encrypted files
nmap <leader>x :call Xgrep()<CR>

"" Version Control

""" Fugitive

"""" Display all dirty files
nnoremap <silent> <Leader>gg :Git<cr>

"""" Display a vertical diff for the current buffer
nnoremap <silent> <Leader>gd :Gvdiff<cr>

"""" Open merge tool to resolve conflicts in the active file
nnoremap <silent> <Leader>gm :Gvdiffsplit!<cr>

"""" While Merging | take left change
nnoremap <silent> <Leader>gl :diffget //2<cr>

"""" When Merging | take right change
nnoremap <silent> <Leader>gr :diffget //3<cr>

"""" Push commited changes
nnoremap <silent> <Leader>gp :G push<cr>

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
set complete=.,w,b,u,t,i,k

"" Graphical Vim

""" Font
"set guifont=Hack

""" Hide the menubar
"set guioptions -=m

""" Hide the toolbar
"set guioptions -=T

" Spelling

"" Dictionary

""" Include dictionary words file
set dictionary+=$VIM/dict/words

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


" Shortcuts

"" Leader Key
let mapleader = '\'

"" Tabs

"" Toggle file tree
nnoremap <silent> <Leader>et :NERDTreeToggle<cr>
nnoremap <silent> <Leader>ef :NERDTreeFind<cr>

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

"" Format

""" Format JSON
nnoremap <leader>json :%!python -m json.tool<CR>

""" Replace curly quotes with straight quotes
noremap <Leader>q :%s/“/"/g<CR>:%s/”/"/g<CR>:%s/’/'/g<CR>:%s/‘/'/g<CR>

""" Prettify HTML
noremap <Leader>ph :!tidy -mi -xml -wrap 0 %<CR>

"" Rename

""" Rename selection
vnoremap <Leader>r "hy:%s/<C-r>h/<C-r>h/gc<left><left><left>

""" Rename locally
nmap <Leader>rn :%s/<C-R><C-W>/<C-R><C-W>/g<left><left>

""" Find and replace
nmap <Leader>ra :Far <C-R><C-W>/<C-R><C-W>/g<left><left>

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

"" Snippets

""" HTML skeleton
noremap <Leader>html :-1read $VSNIPS/html_skeleton.html<CR>5jf>a

""" shUnit test
noremap <Leader>btest :-1read $VSNIPS/bash_shunit_test.bash<CR>ea

""" Bash header
noremap <Leader>bhead :-1read $VSNIPS/bash_header.bash<CR>ea

""" Bash null check
noremap <Leader>bnull :-1read $VSNIPS/bash_nullcheck.bash<CR>ea

