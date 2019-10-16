"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOAD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " not compatible with vi
filetype off
set rtp+=~/.vim/bundle/vundle "runtime includes Vundle
call vundle#begin()
  Plugin 'kien/ctrlp.vim'
  Plugin 'mattn/emmet-vim'
  Plugin 'valloric/MatchTagAlways'
  Plugin 'scrooloose/nerdtree'
  Plugin 'xuyuanp/nerdtree-git-plugin'
  Plugin 'ervandew/supertab'
  Plugin 'jeetsukumaran/vim-buffergator'
  Plugin 'tpope/vim-commentary'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'groenewege/vim-less'
call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYSTEM 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set directory^=$HOME/.vim/tmp/ "swap files
set shortmess+=I " disable welcome
set shortmess+=A " disable swp warnings
set gcr=n:blinkon0 " no blinking cursor
set autoread " detect when a file is changed
set backspace=indent,eol,start " fix backspace
set ttyfast " faster redrawing
set cm=blowfish2 " encryption method
let mapleader = '\'

" Color
syntax on
filetype on
set t_Co=256 " Support 256 colors
let base16colorspace=256  " Access 256 colorspace
set background=dark
colorscheme solarized

" Formatting 
filetype plugin indent on
set linespace=3
set encoding=utf8
set number
set autoindent " automatically set indent of new line
set smartindent
set laststatus=2 " show the satus line all the time
set visualbell 
autocmd GUIEnter * set vb t_vb=
set colorcolumn=80 " indicate 80th column 

" Spelling
hi! SpellBad cterm=underline ctermbg=none ctermfg=none
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell

" Tabs
set expandtab " spaces for tabs 
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " visible width of tabs
set softtabstop=2 " edit as if the tabs are this width 
set shiftwidth=2 " indent spaces 
set shiftround " round indent to a multiple of 'shiftwidth'

" Persistent Undo
set undofile
set undodir=~/.vim/undo/
set undolevels=10000
set undoreload=100000

" Search
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set magic " Set magic on, for regex
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" Ruler
set showcmd
set ruler
set rulerformat=%-1.(%l,%c%V%)

" Folding
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" Quickfix Menu	
map <leader>p :copen<CR>
map <leader>P :cclose<CR>

" Clipboard
set clipboard=unnamed

" Font
if has('unix')
  if has('mac')
    set guifont=Menlo:h14 " OSX
  else
    set guifont=Consola:h13 " LINUX
  endif
elseif has('win32') || has('win64')
  set guifont=Consolas:h13 " WINDOWS
endif

" Cursor Shape
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" Windows GUI
if has('win32') || has('win64')
  source $VIMRUNTIME/mswin.vim
  set guioptions -=T
  set guioptions -=m
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
map <silent> <C-\> :NERDTreeToggle<CR> 
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>
nnoremap <silent> j gj
nnoremap <silent> k gk
let g:NERDTreeQuitOnOpen=0 " close when file opened
let NERDTreeShowHidden=1 " show hidden files

" CtrlP
let g:ctrlp_working_path_mode = 2 " search nearest .git ancestor
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'cr'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("h")': ['<c-i>'],
      \ 'AcceptSelection("v")': ['<c-x>']
      \ }
let g:ctrlp_custom_ignore = {
        \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$'
        \ }
map <leader>\ :CtrlPBuffer<CR>

" Buffergator
let g:buffergator_viewport_split_policy = 'L' 
nmap <leader>j  :BuffergatorMruCyclePrev<cr>
nmap <leader>k  :BuffergatorMruCycleNext<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" Emmet HTML Helper
let g:user_emmet_leader_key='<C-Z>'

