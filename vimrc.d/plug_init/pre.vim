" =======================
" Initialization
" =======================
let s:this_script_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:completion_flag_file = s:this_script_dir . '/.vim_init_complete'

if empty(glob(s:completion_flag_file))
  execute '!bash '.s:this_script_dir.'/init_vim.sh '.g:vimrc_dir.' '.s:completion_flag_file
  if empty(glob(s:completion_flag_file))
      "Here, initialization failed
      echo "Initialization failure!!"
      quit "TODO: Test
  endif
endif
