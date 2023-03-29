" =======================
" Netrw Settings
" =======================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20


" =======================
" Built-in Terminal Settings
" =======================
nnoremap <leader>t :term <CR><C-w>10-
tnoremap <C-n> <C-w>N
tnoremap <C-p> <C-w>""
nnoremap <C-g> :aboveleft wincmd f<CR>

" =======================
" Window resizing Settings
" =======================
nnoremap <C-Down> <C-w>+
nnoremap <C-Up> <C-w>- 
nnoremap <C-Left> <C-w>< 
nnoremap <C-Right> <C-w>> 
nnoremap <silent> <C-w><C-w> :horizontal wincmd =<CR>

" =======================
" Custom Commands
" =======================
command! -nargs=* -complete=shellcmd Cmd new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args> 
command! Maketags !ctags -R . 

" =======================
" Key Remaps
" =======================
" Basic remaps
nnoremap j gj
nnoremap k gk
nnoremap Y y$

"Select everything
nnoremap <C-a> ggVG

" One way to exit insert mode
inoremap jj <esc>

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

" Basic Code Navigation
nnoremap <leader>e :Vex<CR>

" Save on ZZ 
nnoremap ZZ :w<CR>
