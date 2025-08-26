set -g default-terminal "xterm-256color"
set -g mouse on

# set first window to index 1 (not 0) to map more to the keyboard layout...
set-option -g base-index 1
set-window-option -g pane-base-index 1
set-option -g allow-rename off # don't rename windows automatically
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
setw -g monitor-activity off
set -g bell-action none
set -g status-justify 'absolute-centre'
