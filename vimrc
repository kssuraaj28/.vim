" =======================
" Root .vim directory
" =======================
let g:data_dir = expand('<sfile>:p:h')

" =======================
" Leader Key
" =======================
let mapleader = "\<space>"

" =======================
" Initialization
" =======================
let s:completion_flag_file = data_dir . '/.vim_init_complete'

if empty(glob(s:completion_flag_file))
  silent execute '!bash '.g:data_dir.'/init_vim.sh'
    if empty(glob(s:completion_flag_file))
        "Here, initialization failed
        autocmd VimEnter * echo "Started vanilla vim"
        finish
    endif
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" =======================
" Install plugins
" =======================
call plug#begin(data_dir.'/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'

" Source other plugins
let s:extraplugs = g:data_dir . '/extraplug.vim'
if filereadable(expand(s:extraplugs))
    exe 'source' s:extraplugs
endif

call plug#end()


" =======================
" Install a plugin if it does not have a directory associated with it.
" =======================
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" =======================
" Source other settings
" =======================
for vimfile in split(glob(g:data_dir . '/vimrc.d/*.vim' ), '\n')
    exe 'source' vimfile
endfor
