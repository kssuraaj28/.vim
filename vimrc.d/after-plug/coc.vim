if empty($DISABLE_COCVIM)
    " Symbol Navigation
    nnoremap <silent><nowait> <leader>S  <Cmd>CocList -I symbols<cr> 
    nnoremap <silent><nowait> <leader>s  <Cmd>CocList outline<cr>
    nnoremap <silent><nowait> <leader>cl  <Cmd>CocList<cr> 

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
    nmap <silent> <leader>j <Plug>(coc-diagnostic-prev)
    nmap <silent> <leader>k <Plug>(coc-diagnostic-next)

    " Show Documentation -- TODO: Do we need this in insert mode?
    nnoremap <silent> <leader>d <Cmd>call <SID>show_documentation()<CR> 
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
    command -nargs=0 Format :call CocActionAsync('format')


    " Highlight hovered text
    autocmd CursorHold * silent call CocActionAsync('highlight')
endif
