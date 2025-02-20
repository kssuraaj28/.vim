" Root .vim directory
let s:script_path = resolve(expand('<sfile>:p'))
let g:vimrc_dir = fnamemodify(s:script_path, ':h')


" Setting runtimepath, inspired from vim-to-nvim
execute 'set runtimepath^='.g:vimrc_dir
execute 'set runtimepath^='.g:vimrc_dir.'/after/'
let &packpath = &runtimepath


let g:vimrcd_dir = g:vimrc_dir.'/vimrc.d/'
let g:extravimrcd_dir = g:vimrc_dir.'/extravimrc.d/'

" Installing plug
let s:plug_install_flag = g:vimrc_dir . '/.init_complete'
let s:plug_install_script = g:vimrcd_dir . '/install_plug.sh'

if empty(glob(s:plug_install_flag))
  execute '!bash '.s:plug_install_script.' '.g:vimrc_dir.' '.s:plug_install_flag
  if empty(glob(s:plug_install_flag))
      "Here, initialization failed
      echo "Initialization failure!! Starting vanilla vim..."
      sleep 2
      finish
  endif
endif


" We clean the myvimrc autogroup
augroup myvimrc | au!
let s:extra_plug_dirs = split($EXTRA_VIMRCD, ':')
let s:plug_dir_list = [ g:vimrcd_dir ]  + s:extra_plug_dirs "This can be better

function! s:read_all_files(file)
    for dir in s:plug_dir_list
        let vimfiles = split(glob(dir . '/*/'. a:file ), '\n')
        for vimfile in vimfiles
            augroup myvimrc
            exe 'source' vimfile
            augroup END
        endfor

    endfor
endfunction

" Pre config
call s:read_all_files('pre.vim')

" Plugins
let g:plugged_root_dir = g:vimrc_dir.'/bundle/'
call plug#begin(g:plugged_root_dir)
call s:read_all_files('plug.vim')
call plug#end()
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync 
endif

" Post config
call s:read_all_files('post.vim')
