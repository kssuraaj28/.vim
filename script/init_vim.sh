#!/usr/bin/env bash
set -e
#TODO: Ideally, we should have this in vimscript

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
vim_data_dir=${vim_data_dir:-$script_dir/..}

print_msg() {
    local red
    local green
    local yellow
    local blue
    local reset

    red=$(tput setaf 1)
    green=$(tput setaf 2)
    yellow=$(tput setaf 3)
    blue=$(tput setaf 4)
    reset=$(tput sgr0)

    local msg_type=$1
    local msg=$2

    case $msg_type in
        alert)
            local clr=$yellow
            ;;
        error)
            local clr=$red
            ;;
        success)
            local clr=$green
            ;;
        info)
            local clr=$blue
            ;;
        *)
            local clr=''
            ;;
    esac
    echo "${clr}${msg}${reset}"
}

exit_if_absent() {
    cmd=$1
    print_msg info "Checking for $cmd"
    if ! command -v "$cmd" &> /dev/null
    then
        print_msg error "$cmd not found! Please install $cmd"
        print_msg error "Press Enter to start vanilla vim"
        read
        exit
    fi
    print_msg success "$cmd installed"
}

check_and_install() {
    local option=$1
    local target=$2
    local install_cmd=$3
    print_msg info "Checking for $option: $target"

    case $option in
        cmd)
            command -v "$target" &> /dev/null || local fail=1
            ;;
        file)
            [[ -f "$target" ]] || local fail=1
            ;;
    esac

    if ((fail == 1)) &> /dev/null ; then
        print_msg alert "$target not found! Installing $target"
        print_msg alert "Running command: '$install_cmd'"
        bash -c "$install_cmd"
    fi
    print_msg success "$target installed"
}


install_plug() {
    local vimplug_file="$vim_data_dir/autoload/plug.vim"
    local install_cmd="curl -fLo $vimplug_file --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    check_and_install file "$vimplug_file" "$install_cmd"
}

install_node() {
    local node_install_prefix=$vim_data_dir/coc.d/node_install
    rm -rf "$node_install_prefix"
    mkdir -p "$node_install_prefix"
    curl -sL install-node.vercel.app/lts | bash -s -- --prefix=$node_install_prefix --yes
}


mark_completion() {
    local completion_flag_file=".vim_init_complete"
    touch "$completion_flag_file"
}

cd $vim_data_dir
print_msg info "Starting dependency installation"

exit_if_absent git
exit_if_absent curl
exit_if_absent bash

install_plug
install_node

print_msg success "Installation sucessful"
print_msg success "Creating marker $completion_flag_file"
mark_completion
