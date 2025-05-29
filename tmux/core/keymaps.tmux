######################
###  Key Bindings  ###
######################

# Create splits and vertical splits
bind-key v split-window -h -p 50 -c "#{pane_current_path}"
bind-key ^V split-window -h -p 50 -c "#{pane_current_path}"
bind-key s split-window -p 50 -c "#{pane_current_path}"
bind-key ^S split-window -p 50 -c "#{pane_current_path}"

bind c new-window -c '#{pane_current_path}' # Create new window

# Smart pane switching with awareness of vim splits.
# Source: https://github.com/christoomey/vim-tmux-navigator
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?x?)(diff)?$' && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?x?)(diff)?$' && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?x?)(diff)?$' && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?x?)(diff)?$' && tmux send-keys C-l) || tmux select-pane -R"

# Clear screen <prefix> - C-l
bind C-l send-keys 'C-l'

# C-z zoom current pane
unbind C-z
bind -n C-z resize-pane -Z

bind-key C-r source-file ~/.tmux.conf \; display "Config Reloaded !"

######################
###   Copy Mode    ###
######################

bind-key -T copy-mode-vi 'K' send-keys -X page-up
bind-key -T copy-mode-vi 'J' send-keys -X page-down

bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
bind-key -T copy-mode-vi 'y' send-keys -X copy-pipe-and-cancel "pbcopy"
