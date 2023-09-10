" =======================
" Built-in Terminal Settings
" =======================
if has('nvim')

    nnoremap <silent> <leader>t <Cmd>15sp<CR><Cmd>term<CR>i
    tnoremap <C-n> <C-\><C-n>
    tnoremap <C-w>h <Cmd>let b:reinsert=1<CR><Cmd>wincmd h<CR>
    tnoremap <C-w>j <Cmd>let b:reinsert=1<CR><Cmd>wincmd j<CR>
    tnoremap <C-w>k <Cmd>let b:reinsert=1<CR><Cmd>wincmd k<CR>
    tnoremap <C-w>l <Cmd>let b:reinsert=1<CR><Cmd>wincmd l<CR>

    function s:NvimTerminalReenter()
        if ! &buftype ==# "terminal"
            return
        endif
        if exists('b:reinsert') && b:reinsert == 1
            startinsert!
            unlet b:reinsert
        endif
    endfunction
    autocmd BufEnter * call s:NvimTerminalReenter()
    "TODO: Can we somehow source a few functions when we open terminal?
else
    " Running in vim
    nnoremap <silent> <leader>t <Cmd>rightbelow term <CR><C-w>10-
    tnoremap <C-n> <C-w>N
    tnoremap <C-p> <C-w>""
    " TODO: Why do I have this..
    nnoremap <silent> <C-g> <Cmd>aboveleft wincmd f<CR>
endif

tnoremap <silent> <C-j> <Down>
tnoremap <silent> <C-k> <Up>
tnoremap <silent> <C-h> <Left>
tnoremap <silent> <C-l> <Right>
