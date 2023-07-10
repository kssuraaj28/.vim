" =======================
" Custom Commands
" =======================
" TODO: Make this a miniplug
command -nargs=* -complete=shellcmd Cmd new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args> 
"command Maketags !ctags -R .



" =======================
" Command line remaps
" =======================
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
