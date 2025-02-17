" =======================
" Root .vim directory
" =======================
let s:script_path = resolve(expand('<sfile>:p'))
let g:data_dir = fnamemodify(s:script_path, ':h')

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
  execute '!bash '.g:data_dir.'/script/init_vim.sh'
  if empty(glob(s:completion_flag_file))
      "Here, initialization failed
      echo "Started vanilla vim"
      finish
  endif
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

let g:plugged_root_dir = g:data_dir.'/plugged/'
call plug#begin(g:plugged_root_dir)

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
if empty($DISABLE_COCVIM)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" Source other (private) plugins, which are mentioned in vimrc.d/extraplug.vim
let s:extraplugs = g:data_dir . '/vimrc.d/extraplug.vim'
if filereadable(expand(s:extraplugs))
    execute 'source' s:extraplugs
endif


"For small custom plugins
let g:mini_plug_dir = g:data_dir.'/miniplugs/'
for miniplug in split(glob(g:mini_plug_dir . '/*' ), '\n')
    Plug miniplug
endfor


call plug#end()


" =======================
" Install a plugin if it does not have a directory associated with it.
" =======================
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync 
endif

" =======================
" Source other settings (maps, autocmds.)
" =======================
augroup myvimrc
au!
for vimfile in split(glob(g:data_dir . '/vimrc.d/after-plug/*.vim' ), '\n')
    exe 'source' vimfile
endfor
augroup END
