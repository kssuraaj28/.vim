"https://stackoverflow.com/questions/61865932/how-to-get-fzf-vim-ignore-node-modules-and-git-folders
"export VIM_FZF_IGNORE=deps,.*,build
let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{$VIM_FZF_IGNORE}"'

nnoremap <leader>f <Cmd>Files<CR>
nnoremap <leader>g <Cmd>GFiles<CR>
nnoremap <leader>r <Cmd>Rg<CR>
nnoremap <leader>b <Cmd>Buffers<CR>
nnoremap <leader>w <Cmd>Windows<CR>
