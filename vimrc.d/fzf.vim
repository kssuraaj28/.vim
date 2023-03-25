"https://stackoverflow.com/questions/61865932/how-to-get-fzf-vim-ignore-node-modules-and-git-folders
let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{build/*,.git/*,.*}"'

nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Windows<CR>
