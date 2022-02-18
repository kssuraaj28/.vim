" =======================
" Initialization
" =======================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
let completion_flag_file = data_dir . '/.vim_init_complete'

if empty(glob(completion_flag_file))
  silent execute '!bash '.data_dir.'/init_vim.sh'
    if empty(glob(completion_flag_file))
        "Here, initialization failed
        autocmd VimEnter * echo "Started vanilla vim"
        finish
    endif
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" =======================
" My Plugins
" =======================
call plug#begin(data_dir.'/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
call plug#end()

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

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
let &directory = expand(data_dir).'/swp//'
let &undodir = expand(data_dir).'/undo//'
set undofile                    

set nobackup
set nowritebackup

" =======================
" Colorscheme
" =======================
silent! colorscheme gruvbox
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
let mapleader = "\<space>"

" =======================
" Custom Commands
" =======================
command! -nargs=* -complete=shellcmd Cmd new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args> "Cmd runs cmd in shell. Always useful
command! -nargs=0 Format :call CocActionAsync('format')

" =======================
" Auto Commands
" =======================
autocmd BufNewFile  *.c      execute ":0r ".data_dir."/skeleton.c"| execute "normal! ]]"
autocmd BufNewFile  *.sh     execute ":0r ".data_dir."/skeleton.sh" | execute "normal! G"
autocmd CursorHold * silent call CocActionAsync('highlight')

" =======================
" Netrw Settings
" =======================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" =======================
" Built-in Terminal Settings
" =======================
nnoremap <leader>t :term <CR><C-w>10-
tnoremap <C-n> <C-w>N
tnoremap <C-p> <C-w>""
nnoremap <C-g> :aboveleft wincmd f<CR>

" =======================
" Key Remaps
" =======================
" Basic remaps
nnoremap j gj
nnoremap k gk
nnoremap Y y$

"Select everything
nnoremap <C-a> ggVG

" One way to exit insert mode
inoremap jj <esc>

" Local Change Directory
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Basic Code Navigation
nnoremap <leader>e :Vex<CR>
nnoremap <leader>f :Files<CR>
"nnoremap <C-p> :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Windows<CR>

" Symbol Navigation
nnoremap <silent><nowait> <leader>S  :<C-u>CocList -I symbols<cr> 
nnoremap <silent><nowait> <leader>s  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>cl  :<C-u>CocList<cr> 

" Goto Definition, etc.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Error Navigation
nmap <silent> J <Plug>(coc-diagnostic-prev)
nmap <silent> K <Plug>(coc-diagnostic-next) 

" Show Documentation -- TODO: Do we need this in insert mode?
nnoremap <silent> <C-k> :call <SID>show_documentation()<CR> 
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
"
" Formatting selected code.
"xmap = <Plug>(coc-format-selected)
"nmap = <Plug>(coc-format-selected)
