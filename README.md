# My Standalone Vim configuration

## TL;DR
To use this configuration, simply clone this repository as your `~/.vim` directory (for vim) or `~/.config/nvim` directory (for neovim).

## The Big Idea
This vim configuration is supposed to 'just work'. When it is first run, the necessary dependencies are downloaded automatically.

This configuration has been tested on a fresh install of Arch Linux, Debian, MacOS, and even WSL2 on Windows, and does seem to work.

## Getting it running
There are multiple ways you can use this repository (wow!).

1. **As your `.vim` or `.config/nvim` directory**: For vim, simply clone this repository as your (new) `~/.vim` directory, ensuring that you don't have an existing `~/.vimrc`. For neovim, simply clone into `.config/nvim`.

2. **Sourcing `start.vim` from your `.vimrc` and/or `.config/nvim/init.vim`**: A very simple way to do this would be to run:
```
    echo "source $(realpath start.vim)" > ~/.vimrc #vim
    echo "source $(realpath start.vim)" > ~/.config/nvim/init.vim #nvim
```

3. **Using `vim -u start.vim`**: If you already have an existing vim setup, and you want to try out this setup, this is a good option. You can even use an alias to make things easier: `alias myvim="vim -u $(realpath start.vim)"`.

4. **Sourcing `start.vim` after starting vim/nvim**: You can also just `:source start.vim` **after** you start vim.

## Configuration and Plugins
This configuration uses [vim plug](https://github.com/junegunn/vim-plug) as its plugin manager. It is straightforward to use, and keeps things simple. This configuration should make vim a decent code editor with the following features:

* **Good Code Completion**: When working with large projects, this is extremely good to have! [coc.nvim](https://github.com/neoclide/coc.nvim) uses the best parts of [vs-code](https://code.visualstudio.com/) (which has great extensions for code completion), and allows us to have these features in a native vim environment. When used with the [coc snippets extension](https://github.com/neoclide/coc-snippets) and [example snippets](https://github.com/honza/vim-snippets), things work out very well. **Note:** Setting the environment variable `DISABLE_COCVIM` will disable this plugin.
* **An inbuilt terminal**: With vim8 / neovim, the inbuilt terminal is wonderful (with a little bit of tweaking, of course).
* **A Colourscheme**: Nothing wrong with getting vim looking very pretty! The configuration uses [gruvbox](https://github.com/morhetz/gruvbox)
* **File Finding**: This configuration uses the vim plugin of [fzf](https://github.com/junegunn/fzf) for quick fuzzy file finding.
* **Filetree exploration**: With a little bit of massaging, vim's netrw file explorer seems to work well.
* **Git integration**: This configuration uses the [vim-fugitive](https://github.com/tpope/vim-fugitive) plugin for git integration.
* **Tmux Integration**: Using [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) plugin allows for a uniform keybindings for vim and tmux
* **Unix Commands**: [vim-eunuch](https://github.com/tpope/vim-eunuch/) lets you perform common unix commands like `mv`, `rm`, etc. from within vim

### Simple and Extensible
This configuration is meant to be simpl and extensible. `start.vim` contains boilerplate. Configuration options are stored in directories in `vimrc.d`.
* `pre.vim` files are sourced before registering plugins
* `plug.vim` files contain `Plug` command invocations
* `post.vim` are sourced after loading plugins

### Tmux Support
In order to intergrate tmux with the same keybindings, the configuration appends settings to the tmux configuration file (`~/.tmux.conf`) if it doesn't exist.

## Some screenshots
![ss1](https://imgur.com/XidTaTK.png)
![ss2](https://imgur.com/df2FcoU.png)

## Neovim support
If you are a neovim user, you can still use this configuration as mentioned in the setup!

However, there are areas where neovim has significant differences from vim (such as their built-in terminal support). In such cases, one needs to handle both cases separately if one wishes to achieve similar behaviour. Therefore, please let me know if you are using neovim with this configuration, and there are  other such differences that significantly affect your workflow!
