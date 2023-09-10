let g:coc_data_home = g:data_dir . '/coc.d'
let g:coc_config_home = g:coc_data_home
let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-clangd', 'coc-syntax']

let s:node_bindir_coc = g:data_dir . '/coc.d/node_install/bin'
let $PATH = s:node_bindir_coc . ':' . $PATH
