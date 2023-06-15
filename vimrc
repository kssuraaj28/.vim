" =======================
" Root .vim directory
" =======================
let g:data_dir = expand('<sfile>:p:h')

" =======================
" Setting runtimepath, inspired from vim-to-nvim
" =======================
execute 'set runtimepath^='.data_dir
execute 'set runtimepath^='.data_dir.'/after'
let &packpath = &runtimepath


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
" Source some settings. Keep this to minimal prerequites
" =======================
for vimfile in split(glob(g:data_dir . '/vimrc.d/before-plug/*.vim' ), '\n')
    exe 'source' vimfile
endfor


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
let s:extraplugs = g:data_dir . '/vimrc.d/extraplug.vim'
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
" Source other settings (maps, etc.)
" =======================
for vimfile in split(glob(g:data_dir . '/vimrc.d/after-plug/*.vim' ), '\n')
    exe 'source' vimfile
endfor

