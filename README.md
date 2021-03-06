# My Standalone Vim configuration

## TL;DR
To use this configuration, simply clone this repository as your ~/.vim directory

## The Big Idea
This vim configuration does not require the user to manually 'run' any install script. The vimrc included in this configuration does this for you (by running the init\_vim.sh script). If the setup is successful, a marker is set, which prevents re-running the init script, thereby eliminating any overheads during normal use 

## Getting it running
This repository is meant to be your .vim directory. One way to do this would be:

```
# Make sure there isn't a ~/.vimrc and a ~/.vim directory
git clone https://github.com/kssuraaj28/.vim ~/.vim  # Getting the configuration
vim # vim will run the included init_vim.sh script to prepare everything
```

During initialization, the script will check whether the necessary prerequisites are present on the system, and installs any that are missing and easy to install.

This configuration has been tested on a fresh install of Arch Linux, and does seem to work.

## Configuration overview
I use [vim plug](https://github.com/junegunn/vim-plug) as my plugin manager (it seemed very straightforward to use). I like keeping things simple, and actively try to not clutter my vimrc with plugins. However, over my years of using vim as a code editor, these are the things that I find that I need the most:

* **Good Code Completion**: When working with large projects, this is something extremely sweet to have! Personally, I found that [vs-code](https://code.visualstudio.com/) does the best job at this. However, my puny brain just did not get used to the shortcuts of vs-code and more importantly, how much I had to use the mouse with vs-code. Here, [coc.nvim](https://github.com/neoclide/coc.nvim) is a plugin that saves the day for me, allowing me to use the best parts of vs-code in a native vim environment
* **An inbuilt terminal**: With vim8, the inbuilt terminal is wonderful. With a little bit of tweaking, I have something that is all I could ask for.
* **A Colourscheme**: Nothing wrong with getting vim looking very pretty! I personally use [gruvbox](https://github.com/morhetz/gruvbox)
* **File Finding**: During my command line adventures, I seem to have been spoilt by [fzf](https://github.com/junegunn/fzf). Thus, it was inevitable that I use fzf's vim plugin for quick fuzzy file finding.
* **Filetree exploration**: With a little bit of massaging, vim's netrw file explorer seems to work very well for me.

### My Plugins
* [fzf](https://github.com/junegunn/fzf) and [fzf.vim](https://github.com/junegunn/fzf.vim): Fuzzy file finder to quickly search for and open files
* [coc.nvim](https://github.com/neoclide/coc.nvim): For code completion. The best from vs-code 
* [gruvbox](https://github.com/morhetz/gruvbox): A pretty colorscheme

## Some screenshots
![ss1](https://imgur.com/XidTaTK.png)
![ss2](https://imgur.com/df2FcoU.png)
