" Coc Directory
let g:coc_config_home = g:data_dir
let g:coc_data_home = g:data_dir . '/coc.d'
let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-clangd', 'coc-vimtex']

" Symbol Navigation
nnoremap <silent><nowait> <leader>S  :<C-u>CocList -I symbols<cr> 
nnoremap <silent><nowait> <leader>s  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>cl  :<C-u>CocList<cr> 

" Function objects, class objects, etc.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Goto Definition, etc.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Error Navigation
nmap <silent> J <Plug>(coc-diagnostic-prev)
nmap <silent> K <Plug>(coc-diagnostic-next) 

" Show Documentation -- TODO: Do we need this in insert mode?
nnoremap <silent> <C-k> :call <SID>show_documentation()<CR> 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Show Documentation -- Window scrolling
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Code Completion -- Vanilla vim has a weird bug
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" QuickFix
nmap <Leader>qf <Plug>(coc-fix-current)

" Symbol renaming, vscode style.
nmap <F2> <Plug>(coc-rename)


" Visual Mode made better
nmap <silent> <C-s> <Plug>(coc-range-select) 
xmap <silent> <C-s> <Plug>(coc-range-select)


" Command to format things
command! -nargs=0 Format :call CocActionAsync('format')


" Highlight hovered text
autocmd CursorHold * silent call CocActionAsync('highlight')
