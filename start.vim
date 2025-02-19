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


" We clean the myvimrc autogroup
augroup myvimrc | au!
function! s:read_all_files(file)
    for vimfile in split(glob(g:data_dir . '/vimrc.d/**/'. a:file ), '\n')
        augroup myvimrc
        exe 'source' vimfile
        augroup END
    endfor
endfunction

" Pre config
call s:read_all_files('pre.vim')

" Plugins
let g:plugged_root_dir = g:data_dir.'/bundle/'
call plug#begin(g:plugged_root_dir)
call s:read_all_files('plug.vim')
call plug#end()

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync 
endif

" Post config
call s:read_all_files('post.vim')
