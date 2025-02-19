#!/usr/bin/env bash
set -e
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$script_dir"

tmux_cfg_file="$1"
completion_flag_file="$2"


tmux_cfg_text=$(cat << 'EOF'
set -g base-index 1

unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# Without -n or -T, bind keys are for the prefix key table
# With -T Table, you can have a custom table
# With -r, we mention that the key may repeat

bind c new-window -c "#{pane_current_path}"
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

bind r source-file ~/.tmux.conf

bind h select-pane -L
bind j select-pane -D 
bind k select-pane -U
bind l select-pane -R

bind -n C-h select-pane -L
bind -n C-j select-pane -D 
bind -n C-k select-pane -U
bind -n C-l select-pane -R

bind -n M-h resize-pane -L
bind -n M-j resize-pane -D 
bind -n M-k resize-pane -U
bind -n M-L resize-pane -R

set -g mouse on
set -g status-bg black
set -g status-fg white
set -g status-interval 60
set -g status-left-length 30
set -g status-left '#[fg=green](#S) #(whoami)'
set -g status-right '#[fg=white]%H:%M#[default]'
set -g default-terminal "screen-256color"

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
#https://www.reddit.com/r/vim/comments/c11cad/use_ctrlw_for_both_tmux_and_vim/
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

bind-key -Tvimtable 's' split-window -v -c "#{pane_current_path}"
bind-key -Tvimtable 'v' split-window -h -c "#{pane_current_path}"
bind-key -Tvimtable 'C-w' send-keys C-w

set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"
unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode after dragging with mouse
EOF
)



echo "Appending to $tmux_cfg_file"
echo "$tmux_cfg_text" >> "$tmux_cfg_file"
echo "Success!"

touch "$completion_flag_file"
