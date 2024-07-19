#!/usr/bin/env bash
set -e
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$script_dir"/../vimrc.d/

#Maybe I should have a plugin-free vimrc too?

files='
before-plug/sets.vim
before-plug/nav.vim
after-plug/nav.vim
after-plug/omni.vim
after-plug/term.vim
'

for file in $files ; do 
    cat $file
done
