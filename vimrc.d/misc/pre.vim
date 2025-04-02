" =======================
" Basic Settings
" =======================

" This actually makes Syntax autocommands...
syntax on

" I have no idea what this does
filetype plugin on

" =======================
" Leader Key
" =======================
let mapleader = "\<space>"
let maplocalleader = "," "I don't think that there is any difference between the two, other than intention.

set nocompatible
set ruler
set laststatus=2
set noerrorbells

set showmode 
set showcmd

set path+=**
set wildmenu

set dictionary+=/usr/share/dict/words

set hidden

set splitbelow 
set splitright 

set updatetime=300
set shortmess+=c

set nohls

"set number
"set relativenumber

" =======================
" Indentation Settings
" =======================
set autoindent
set smartindent
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4

" =======================
" / Search settings
" =======================
set incsearch
set ignorecase
set smartcase
set showmatch

" =======================
" Undo, Swaps, Backups
" =======================
" let &directory = expand(vimrc_dir).'/swp//'
" let &undodir = expand(vimrc_dir).'/undo//'
" set undofile                    

set nobackup
set nowritebackup

" =======================
" Mouse Support
" =======================
set mouse=n

" =======================
" System Clipboard Integration
" =======================
set clipboard=unnamedplus

" =======================
" Windows don't change
" =======================
"set noequalalways
set eadirection=hor

"" https://akrabat.com/using-vimrc-for-project-specific-settings/
"" =======================
"" Project specific settings
"" =======================
"set exrc
"set secure
"
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
