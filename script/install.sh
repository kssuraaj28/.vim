script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$script_dir"/..

source_line="source $(realpath start.vim)"
echo "${source_line}" > ~/.vimrc
mkdir -p ~/.config/nvim
echo "${source_line}" > ~/.config/nvim/init.vim
