#!/usr/bin/env bash
set -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$script_dir"

node_install_dir=$1
completion_flag_file=$2

node_install_prefix=node_install
rm -rf "$node_install_prefix"
mkdir -p "$node_install_prefix"
curl -sL install-node.vercel.app/lts | bash -s -- --prefix=$node_install_prefix --yes
touch "$completion_flag_file"
