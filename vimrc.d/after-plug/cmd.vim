" =======================
" Custom Commands
" =======================
" TODO: Make this a miniplug
command -nargs=* -complete=shellcmd Cmd new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args> 
"command Maketags !ctags -R .
