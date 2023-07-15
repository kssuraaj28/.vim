" =======================
" Window resizing Settings
" =======================
nnoremap <C-Down> <C-w>+
nnoremap <C-Up> <C-w>- 
nnoremap <C-Left> <C-w>< 
nnoremap <C-Right> <C-w>> 
nnoremap <silent> <C-w><C-w> :horizontal wincmd =<CR>

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
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
nnoremap <leader>.. :lcd ..<CR>:pwd<CR>

" Gotofile 
nnoremap gf :abo sp <cfile><CR>

"Move around selected text code
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Mass rename
nnoremap <leader>n :%s/\<<C-r><C-w>\>//g<Left><Left>

" Basic Code Navigation
nnoremap <leader>e :Vex<CR>

" Save on ZZ 
nnoremap ZZ :w<CR>

" Oh no, I lost my cursor!
nnoremap <silent> <leader>h <Cmd>setl cursorcolumn! \| setl cursorline!<CR>
