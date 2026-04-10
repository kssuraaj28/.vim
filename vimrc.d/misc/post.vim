command -nargs=* -complete=shellcmd Cmd new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args> 
command Scratch setlocal buftype=nofile | setlocal bufhidden=delete | setlocal nobuflisted | setlocal noswapfile

if ! has('nvim')
    "neovim does not seem to have :horizontal
    nnoremap <silent> <C-w><C-w> <Cmd>horizontal wincmd =<CR>
endif

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
noremap! jK <C-c>
noremap! JK <C-c>
noremap! Jk <C-c>

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

" Some omnithing
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
            \	if &omnifunc == "" |
            \		setlocal omnifunc=syntaxcomplete#Complete |
            \	endif
endif

nnoremap ZC <Cmd>call <SID>WriteDiffUnderlying()<CR>
vnoremap <leader><Enter> <Cmd>diffput<CR><esc>

" This function will force write and then will also make a diff window
function! s:WriteDiffUnderlying() abort
  let l:file = expand('%:p')
  if empty(l:file) || !filereadable(l:file)
    echohl ErrorMsg | echo 'no underlying file' | echohl None
    return
  endif

  let l:mem  = getline(1, '$')
  let l:disk = readfile(l:file)
  if l:mem ==# l:disk
    echohl WarningMsg | echo 'file unchanged on disk' | echohl None
    return
  endif

  let l:ft = &filetype
  write!
  diffthis

  vsplit
  enew
  call setline(1, l:disk)
  let &l:filetype  = l:ft
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
  setlocal nomodifiable readonly
  diffthis

endfunction
