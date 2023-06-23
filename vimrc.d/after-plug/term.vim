" =======================
" Built-in Terminal Settings
" =======================
if has('nvim')
    nnoremap <silent> <leader>t :15sp<CR>:term<CR>i
    tnoremap <C-n> <C-\><C-n>
    tnoremap <C-w>h <C-\><C-N><C-w>h
    tnoremap <C-w>j <C-\><C-N><C-w>j
    tnoremap <C-w>k <C-\><C-N><C-w>k
    tnoremap <C-w>l <C-\><C-N><C-w>l
    autocmd BufEnter * if &buftype ==# 'terminal' | startinsert! | endif
    "TODO: Can we make this better?
else
    " Running in vim
    nnoremap <silent> <leader>t :rightbelow term <CR><C-w>10-
    tnoremap <C-n> <C-w>N
    tnoremap <C-p> <C-w>""
    " TODO: Why do I have this..
    nnoremap <silent> <C-g> :aboveleft wincmd f<CR>
endif

tnoremap <silent> <C-j> <Down>
tnoremap <silent> <C-k> <Up>
tnoremap <silent> <C-h> <Left>
tnoremap <silent> <C-l> <Right>
