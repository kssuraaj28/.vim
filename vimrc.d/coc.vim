" Coc Directory
let coc_dir = g:data_dir . '/coc.d'
let g:coc_config_home = coc_dir
let g:coc_data_home = coc_dir
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
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Error Navigation
nnoremap <silent> J <Plug>(coc-diagnostic-prev)
nnoremap <silent> K <Plug>(coc-diagnostic-next) 

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
nnoremap <Leader>qf <Plug>(coc-fix-current)

" Symbol renaming, vscode style.
nnoremap <F2> <Plug>(coc-rename)


" Visual Mode made better
nmap <silent> <C-s> <Plug>(coc-range-select) 
xmap <silent> <C-s> <Plug>(coc-range-select)


" Command to format things
command! -nargs=0 Format :call CocActionAsync('format')


" Highlight hovered text
autocmd CursorHold * silent call CocActionAsync('highlight')
