"function miniplug#
let s:skel_path = resolve(expand('<sfile>:p:h')).'/../skel/'

function skelutil#get_skel_dir()
    return s:skel_path
endfunction

function skelutil#goto_skel()
    execute 'cd '.skelutil#get_skel_dir()
    pwd
endfunction

function s:is_fresh()
    return line('$') == 1 && getline(1) == ''
endfunction
"https://vi.stackexchange.com/questions/21856/is-it-necessary-to-always-add-to-function-and-command
"function is better than function!
function skelutil#read_skel(filename,...)
    if s:is_fresh()
        silent execute ":0r ".s:skel_path.a:filename
        for extra_cmd in a:000
            execute extra_cmd
        endfor
    endif
endfunction
