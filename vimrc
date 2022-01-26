" =======================
" Installing Plug
" =======================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" =======================
" My Plugins
" =======================
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
call plug#end()

" =======================
" Basic Settings
" =======================
syntax on
filetype plugin on

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
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif

if !isdirectory($HOME."/.vim/swp")
    call mkdir($HOME."/.vim/swp", "", 0700)
endif

set directory=$HOME/.vim/swp//  
set undodir=$HOME/.vim/undo//  
set undofile                    

set nobackup
set nowritebackup

" =======================
" Colorscheme
" =======================
colorscheme gruvbox
set background=dark

" =======================
" Mouse Support
" =======================
set mouse=n

" =======================
" System Clipboard Integration
" =======================
set clipboard=unnamedplus

" =======================
" Leader Key
" =======================
let mapleader = "\<Space>"

" =======================
" Custom Commands
" =======================
command! -nargs=* -complete=shellcmd Cmd new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args> "Cmd runs cmd in shell. Always useful
command! -nargs=0 Format :call CocActionAsync('format')

" =======================
" Auto Commands
" =======================
autocmd BufNewFile  *.c      0r ~/.vim/skeleton.c
autocmd BufNewFile  *.sh     0r ~/.vim/skeleton.sh | execute "normal! G"
autocmd CursorHold * silent call CocActionAsync('highlight')

" =======================
" Netrw Settings
" =======================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" =======================
" Key Remaps
" =======================
" Basic remaps
nnoremap j gj
nnoremap k gk

" One way to exit insert mode
inoremap jj <esc>

" Built-in terminal
nnoremap <leader>t :term<CR>

" Local Change Directory
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Basic Code Navigation
nnoremap <leader>e :Vex<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Windows<CR>

" Symbol Navigation
nnoremap <silent><nowait> <space>S  :<C-u>CocList -I symbols<cr> 
nnoremap <silent><nowait> <space>s  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>cl  :<C-u>CocList<cr> 

" Goto Definition, etc.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Error Navigation
nmap <silent> J <Plug>(coc-diagnostic-prev)
nmap <silent> K <Plug>(coc-diagnostic-next) 

" Show Documentation
nnoremap <silent> H :call <SID>show_documentation()<CR> 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Code Completion -- Vanilla vim has a weird bug
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" QuickFix
nmap qf  <Plug>(coc-fix-current)

" Symbol renaming, vscode style.
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
xmap = <Plug>(coc-format-selected)
nmap = <Plug>(coc-format-selected)

" Visual Mode made better
nmap <silent> <C-s> <Plug>(coc-range-select) 
xmap <silent> <C-s> <Plug>(coc-range-select)

" =======================
" To be assorted, Old Commands
" =======================

"let g:asmsyntax = 'nasm'
"command! Maketags !ctags -R . "Make tags file - Legacy code indexing
"TODO -- What is silent and all
"nnoremap <leader>b :buffers<CR>:buffer<space>
"TODO -- Have a function that updates Plug, Coc
