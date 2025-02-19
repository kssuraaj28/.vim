if empty($DISABLE_COCVIM)
    let s:this_script_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
    let g:coc_data_home = s:this_script_dir . '/coc.d'
    let g:coc_config_home = g:coc_data_home
    let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-clangd', 'coc-syntax']


    let s:completion_flag_file = s:this_script_dir . '/.node_install_complete'
    let s:node_install_dir = s:this_script_dir . '/node_install/'

    if empty(glob(s:completion_flag_file))
        execute '!'.s:this_script_dir.'/install_node.sh '.s:node_install_dir.' '.s:completion_flag_file
        if empty(glob(s:completion_flag_file))
            echom "Node install failure for coc-vim"
            let $DISABLE_COCVIM='y'
            finish "TODO: Test this
        endif
    endif

    let $PATH = s:node_install_dir . '/bin:' . $PATH
endif
