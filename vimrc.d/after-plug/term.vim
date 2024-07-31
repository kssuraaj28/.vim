" =======================
" Built-in Terminal Settings
" =======================
if has('nvim')
    "TODO: Refactor
    nnoremap <silent> <leader>t <Cmd>15sp<CR><Cmd>term<CR>
    nnoremap <silent> <leader>; <Cmd>15sp<CR><Cmd>terminal "%:p"<CR>
    tnoremap <C-n> <C-\><C-n>

    tnoremap <C-w>h <Cmd>let b:reinsert=1<CR><Cmd>wincmd h<CR>
    tnoremap <C-w>j <Cmd>let b:reinsert=1<CR><Cmd>wincmd j<CR>
    tnoremap <C-w>k <Cmd>let b:reinsert=1<CR><Cmd>wincmd k<CR>
    tnoremap <C-w>l <Cmd>let b:reinsert=1<CR><Cmd>wincmd l<CR>
    tnoremap <C-w>s <Cmd>let b:reinsert=1<CR><Cmd>wincmd s<CR>
    tnoremap <C-w>n <Cmd>let b:reinsert=1<CR><Cmd>wincmd n<CR>
    tnoremap <C-w>v <Cmd>let b:reinsert=1<CR><Cmd>wincmd v<CR>

    function s:NvimTerminalReenter()
        " There is still a slight bug when  you switch between terminals
        " However, it should be okay
        if ! &buftype ==# "terminal"
            return
        endif
        if exists('b:reinsert') && b:reinsert == 1
            startinsert!
            unlet b:reinsert
        endif
    endfunction
    autocmd BufEnter * call s:NvimTerminalReenter()
    autocmd TermOpen * startinsert
    "TODO: Can we somehow source a few functions when we open terminal?
    
   
else
    " Running in vim
    nnoremap <silent> <leader>t <Cmd>rightbelow term <CR><C-w>10-
    nnoremap <silent> <leader>; <Cmd>rightbelow terminal "%:p"<CR>
    tnoremap <C-n> <C-w>N
    tnoremap <C-p> <C-w>""
    " TODO: Why do I have this..
    nnoremap <silent> <C-g> <Cmd>aboveleft wincmd f<CR>
endif

tnoremap <silent> <C-j> <Down>
tnoremap <silent> <C-k> <Up>
tnoremap <silent> <C-h> <Left>
tnoremap <silent> <C-l> <Right>
