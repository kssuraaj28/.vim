"This is some god level shell specific default thing
inoremap <C-D> <ESC>bywea=${<C-R>":-}<Left>

let s:skel_path = resolve(expand('<sfile>:p:h')).'/../skel/'
"TODO: Have a function to not have repeated code
if line('$') == 1 && getline(1) == ''
    silent execute ":0r ".s:skel_path."/skeleton.sh" | execute "normal! G"
endif
