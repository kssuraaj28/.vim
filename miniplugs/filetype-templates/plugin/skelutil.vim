"function miniplug#
let s:skel_path = resolve(expand('<sfile>:p:h')).'/../skel/'

function s:is_fresh()
    return line('$') == 1 && getline(1) == ''
endfunction

"TODO: Maybe this should be function!
function skelutil#read_skel(filename,...)
    if s:is_fresh()
        silent execute ":0r ".s:skel_path.a:filename
        for extra_cmd in a:000
            execute extra_cmd
        endfor
    endif
endfunction
