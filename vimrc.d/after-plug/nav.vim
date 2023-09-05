" =======================
" Window resizing Settings
" =======================
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>- 
nnoremap <C-h> <C-w>< 
nnoremap <C-l> <C-w>> 

if ! has('nvim')
    "neovim does not seem to have :horizontal
    nnoremap <silent> <C-w><C-w> <Cmd>horizontal wincmd =<CR>
endif

" =======================
" Command line remaps
" =======================
noremap! <C-j> <Down>
noremap! <C-k> <Up>
noremap! <C-h> <Left>
noremap! <C-l> <Right>

" =======================
" Key Remaps
" =======================
" Basic remaps
nnoremap j gj
nnoremap k gk
nnoremap Y y$

"Select everything
nnoremap <C-a> ggVG

" One way to exit insert/command mode
noremap! jk <C-c>

" Ctrl-u is useless
inoremap <C-u> <nop>
inoremap <C-w> <nop>

" Local Change Directory
nnoremap <leader>cd <Cmd>lcd %:p:h<CR><Cmd>pwd<CR>
nnoremap <leader>.. <Cmd>lcd ..<CR><Cmd>pwd<CR>

"Move around selected text code
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Mass rename
nnoremap <leader>n :%s/\<<C-r><C-w>\>//g<Left><Left>

" Basic Code Navigation
nnoremap <leader>e <Cmd>Vex<CR>

" Save on ZZ 
nnoremap ZZ <Cmd>w<CR>

" Oh no, I lost my cursor!
nnoremap <silent> <leader>h <Cmd>setl cursorcolumn! \| setl cursorline!<CR>
