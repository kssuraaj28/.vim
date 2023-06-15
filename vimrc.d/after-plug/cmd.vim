" =======================
" Custom Commands
" =======================
command! -nargs=* -complete=shellcmd Cmd new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args> 
"command! Maketags !ctags -R .
