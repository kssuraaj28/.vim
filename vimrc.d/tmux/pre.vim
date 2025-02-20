let s:this_script_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:completion_flag_file = s:this_script_dir . '/.init_complete'
let s:tmux_cfg_file = '~/.tmux.conf'

if empty(glob(s:completion_flag_file))
    execute '!'.s:this_script_dir.'/install_tmux_cfg.sh '.s:tmux_cfg_file.' '.s:completion_flag_file
    if empty(glob(s:completion_flag_file))
        echom "Tmux config setup error..."
    endif
endif


let g:tmux_navigator_no_mappings = 1
