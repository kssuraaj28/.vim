script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$script_dir"/..

start_vim=$(realpath start.vim)
echo "source ${start_vim}" > ~/.vimrc
mkdir -p ~/.config/nvim
echo "source ${start_vim}" > ~/.config/nvim/init.vim
