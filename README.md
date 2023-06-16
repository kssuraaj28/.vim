# My Standalone Vim configuration

## TL;DR
To use this configuration, simply clone this repository as your `~/.vim` directory (for vim) or `~/.config/nvim` directory (for neovim).

## The Big Idea
This vim configuration does not require the user to manually 'run' any install script. The vimrc included in this configuration does this for you (by running the init\_vim.sh script). If the setup is successful, a marker is set, which prevents re-running the init script, thereby eliminating any overheads during normal use 

During initialization, the script will check whether the necessary prerequisites are present on the system, and installs any that are missing and easy to install.

This configuration has been tested on a fresh install of Arch Linux, Debian and WSL2 on Windows, and does seem to work.

## Getting it running
There are multiple ways you can use this repository (wow!).

1. **As your `.vim` or `.config/nvim` directory**: For vim, simply clone this repository as your (new) `~/.vim` directory, ensuring that you don't have an existing `~/.vimrc`. For neovim, simply clone into `.config/nvim`.

2. **Sourcing `start.vim` from your `.vimrc` and/or `.config/nvim/init.vim`**: A very simple way to do this would be to run `script/install.sh`, which does this for you.

3. **Using `vim -u start.vim`**: If you already have an existing vim setup, and you want to try out this setup, this is a good option. You can even use an alias to make things easier: `alias myvim="vim -u $(realpath start.vim)"`.

4. **Sourcing `start.vim` after starting vim/nvim**: You can also just `:source start.vim` **after** you start vim.

## Configuration overview
I use [vim plug](https://github.com/junegunn/vim-plug) as my plugin manager (it seemed very straightforward to use). I like keeping things simple, and actively try to not clutter my vimrc with plugins. However, over my years of using vim as a code editor, these are the things that I find that I need the most:

* **Good Code Completion**: When working with large projects, this is something extremely sweet to have! Personally, I found that [vs-code](https://code.visualstudio.com/) does the best job at this. However, I just did not get used to the shortcuts of vs-code and more importantly, how much I had to use the mouse with vs-code. Here, [coc.nvim](https://github.com/neoclide/coc.nvim) is a plugin that saves the day for me, allowing me to use the best parts of vs-code in a native vim environment. When used with the [coc snippets extension](https://github.com/neoclide/coc-snippets) and [example snippets](https://github.com/honza/vim-snippets), things work out very well!
* **An inbuilt terminal**: With vim8 / neovim, the inbuilt terminal is wonderful. With a little bit of tweaking, I have something that is all I could ask for.
* **A Colourscheme**: Nothing wrong with getting vim looking very pretty! I personally use [gruvbox](https://github.com/morhetz/gruvbox)
* **File Finding**: During my command line adventures, I seem to have been spoilt by [fzf](https://github.com/junegunn/fzf). Thus, it was inevitable that I use fzf's vim plugin for quick fuzzy file finding.
* **Filetree exploration**: With a little bit of massaging, vim's netrw file explorer seems to work very well for me.

### My Plugins
* [fzf](https://github.com/junegunn/fzf) and [fzf.vim](https://github.com/junegunn/fzf.vim): Fuzzy file finder to quickly search for and open files
* [coc.nvim](https://github.com/neoclide/coc.nvim) and [vim-snippets](https://github.com/honza/vim-snippets): For code completion. 
* [gruvbox](https://github.com/morhetz/gruvbox): A pretty colorscheme

## Some screenshots
![ss1](https://imgur.com/XidTaTK.png)
![ss2](https://imgur.com/df2FcoU.png)

## Neovim support
If you are a neovim user, you can still use this configuration as mentioned in the setup!

However, there are areas where neovim has significant differences from vim (such as their built-in terminal support). In such cases, one needs to handle both cases separately if one wishes to achieve similar behaviour. Therefore, please let me know if you are using neovim with this configuration, and there are  other such differences that significantly affect your workflow!
