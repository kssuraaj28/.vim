" =======================
" Root .vim directory
" =======================
let s:script_path = resolve(expand('<sfile>:p'))
let g:vimrc_dir = fnamemodify(s:script_path, ':h')

" =======================
" Setting runtimepath, inspired from vim-to-nvim
" =======================
execute 'set runtimepath^='.g:vimrc_dir
execute 'set runtimepath^='.g:vimrc_dir.'/after'
let &packpath = &runtimepath


" We clean the myvimrc autogroup
augroup myvimrc | au!
function! s:read_all_files(file)
    let main_plug = split(glob(g:vimrc_dir . '/vimrc.d/*/'. a:file ), '\n')

    " Extraplug are plugins that I don't want to track...
    let extra_plug = split(glob(g:vimrc_dir . '/vimrc.d/extraplug/*/'. a:file ), '\n')
    let all_plug = main_plug + extra_plug

    for vimfile in all_plug
        augroup myvimrc
        exe 'source' vimfile
        augroup END
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
