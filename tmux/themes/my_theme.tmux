# green tokyodark
CURRENT_WINDOW_TEXT=#95C561

# CURRENT_WINDOW_TEXT=#95C561
CURRENT_WINDOW_BG=#1F2335
STATUS_BG=#1a1b26
CLOSED_WINDOWS_BG=#1a1b26
CLOSED_WINDOWS_TEXT=brightwhite

#  modes
setw -g clock-mode-colour colour5
setw -g mode-style 'fg=green bg=colour0 bold'

# panes
set -g pane-border-style 'fg=#282a36 bg=colour0'
set -g pane-active-border-style 'bg=colour0 fg=#E05373'

# statusbar
set -g status-right '#[fg=white,bg=#24283B] #{battery_icon} #{battery_percentage} #[fg=white,bg=#24283B] CPU #{cpu_percentage} #[fg=white,bg=#24283B] RAM #{ram_percentage} #[fg=white,bg=#24283B] %d/%m #[fg=white,bg=#24283B] %H:%M:%S '
set -g status-right-length 150
set -g status-left-length 10

setw -g window-status-current-style 'fg=#E05373 bg=#44475a'
setw -g window-status-current-format ' #I #[fg=colour7]#W#[fg=colour8] '

setw -g window-status-style 'fg=#E05373 bg=#282a36 dim'
setw -g window-status-format ' #I #[fg=colour250]#W#[fg=colour244]'

setw -g window-status-bell-style 'fg=colour255 bg=colour1 bold'

set -g status-bg "$STATUS_BG"

set -g status-left "#[fg=black,bg=#fc6f03] #S #[fg=black,bg=cyan,nobold,noitalics,nounderscore]"

set -g window-status-current-format "#[fg=$CURRENT_WINDOW_TEXT,bg=$CURRENT_WINDOW_BG]   #I #W  "

set -g window-status-format "#[fg=$CLOSED_WINDOWS_TEXT,bg=$CLOSED_WINDOWS_BG,nobold,noitalics,nounderscore]  #I #W "
set -g pane-border-style "fg=#3b4261"
set -g pane-active-border-style "fg=#7aa2f7"

# messages
set -g message-style 'fg=#95C561 bg=#282a36 bold'
