# My Standalone Vim configuration

## TL;DR
To use this configuration, simply clone this repository as your `~/.vim` directory (for vim) or `~/.config/nvim` directory (for neovim).

## The Big Idea
This vim configuration does not require the user to manually 'run' any install script. The vimrc included in this configuration does this for you (by running the `init_vim.sh` script). If the setup is successful, a marker is set, which prevents re-running this init script, thereby eliminating any overheads during normal use.

During initialization, the script will check whether the necessary prerequisites are present on the system, and installs any that are missing and easy to install.

This configuration has been tested on a fresh install of Arch Linux, Debian, MacOS, and even WSL2 on Windows, and does seem to work.

## Getting it running
There are multiple ways you can use this repository (wow!).

1. **As your `.vim` or `.config/nvim` directory**: For vim, simply clone this repository as your (new) `~/.vim` directory, ensuring that you don't have an existing `~/.vimrc`. For neovim, simply clone into `.config/nvim`.

2. **Sourcing `start.vim` from your `.vimrc` and/or `.config/nvim/init.vim`**: A very simple way to do this would be to run `script/install.sh`, which does this for you.

3. **Using `vim -u start.vim`**: If you already have an existing vim setup, and you want to try out this setup, this is a good option. You can even use an alias to make things easier: `alias myvim="vim -u $(realpath start.vim)"`.

4. **Sourcing `start.vim` after starting vim/nvim**: You can also just `:source start.vim` **after** you start vim.

## Configuration overview
This configuration uses [vim plug](https://github.com/junegunn/vim-plug) as its plugin manager. It is straightforward to use, and keeps things simple. This configuration should make vim a decent code editor with the following features:

* **Good Code Completion**: When working with large projects, this is extremely good to have! [coc.nvim](https://github.com/neoclide/coc.nvim) uses the best parts of [vs-code](https://code.visualstudio.com/) (which has great extensions for code completion), and allows us to have these features in a native vim environment. When used with the [coc snippets extension](https://github.com/neoclide/coc-snippets) and [example snippets](https://github.com/honza/vim-snippets), things work out very well.
* **An inbuilt terminal**: With vim8 / neovim, the inbuilt terminal is wonderful (with a little bit of tweaking, of course).
* **A Colourscheme**: Nothing wrong with getting vim looking very pretty! The configuration uses [gruvbox](https://github.com/morhetz/gruvbox)
* **File Finding**: This configuration uses the vim plugin of [fzf](https://github.com/junegunn/fzf) for quick fuzzy file finding.
* **Filetree exploration**: With a little bit of massaging, vim's netrw file explorer seems to work well.
* **Git integration**: This configuration uses the [vim-fugitive](https://github.com/tpope/vim-fugitive) plugin for git integration.
* **Tmux Integration**: Using [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) plugin allows for a uniform keybindings for vim and tmux

### Highly Extensible
This configuration is meant to be highly extensible.
* You can choose to add 'local/temporary plugins' by adding a `Plug ....` line to `vimrc.d/extraplug.vim` (after creating it). This will not pollute your git repository.
* The `miniplugs` directory contains (as the name suggests) small custom plugins. Adding a new custom plugin is as simple as creating a subdirectory of `miniplugs`, and it will be added to the `runtimepath` automatically.

### Tmux Support
In order to intergrate tmux with the same keybindings, include the following in your tmux configuration:
```
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'"

bind-key -n C-w if-shell "$is_vim" "send-keys C-w" "switch-client -Tvimtable"
bind-key -Tvimtable 'h' select-pane -L
bind-key -Tvimtable 'j' select-pane -D
bind-key -Tvimtable 'k' select-pane -U
bind-key -Tvimtable 'l' select-pane -R

bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'resize-pane -L'
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'resize-pane -D'
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'resize-pane -U'
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'resize-pane -R'

bind-key -Tvimtable 's' split-window -v
bind-key -Tvimtable 'v' split-window -h
bind-key -Tvimtable 'C-w' send-keys C-w
```

## Some screenshots
![ss1](https://imgur.com/XidTaTK.png)
![ss2](https://imgur.com/df2FcoU.png)

## Neovim support
If you are a neovim user, you can still use this configuration as mentioned in the setup!

However, there are areas where neovim has significant differences from vim (such as their built-in terminal support). In such cases, one needs to handle both cases separately if one wishes to achieve similar behaviour. Therefore, please let me know if you are using neovim with this configuration, and there are  other such differences that significantly affect your workflow!
