#!/usr/bin/env bash
set -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
vimrc_dir=$1
comp_file=$2

exit_if_absent() {
    cmd=$1
    echo "Checking for $cmd"
    if ! command -v "$cmd" &> /dev/null
    then
        echo "$cmd not found! Please install $cmd"
        exit
    fi
    echo "$cmd installed"
}


install_plug() {
    local vimplug_file="$vimrc_dir/autoload/plug.vim"
    [[ -f "$vimplug_file" ]] || curl -fLo $vimplug_file --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

mark_completion() {
    touch "$comp_file"
}

echo "Starting dependency installation"

exit_if_absent git
exit_if_absent curl
exit_if_absent bash
exit_if_absent rg

install_plug

echo "Installation sucessful"
mark_completion
