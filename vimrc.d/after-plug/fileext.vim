" =======================
" Auto Commands
" =======================
autocmd BufNewFile  *.c      execute ":0r ".g:data_dir."/skel/skeleton.c" | execute "normal! ]]"
autocmd BufNewFile  *.sh     execute ":0r ".g:data_dir."/skel/skeleton.sh" | execute "normal! G"
" TODO: Test better
autocmd BufEnter  *.todo   setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\\s*#' 
