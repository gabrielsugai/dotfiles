### Start theme ###
# Make status bar transparent
set -g status-style 'bg=terminal'
set -g @catppuccin_status_background "none"

# status left style
set -g status-left-length 50
set -g status-left ""

# Trasparent left status bar (with bg=terminal)
set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_green},fg=#{@thm_mantle},bold]  #S },#{#[fg=#{@thm_green}]  #S }}"
set -ga status-left "#[bg=terminal,fg=#{@thm_overlay_0},none]│"
set -ga status-left "#[bg=terminal,fg=#{@thm_red}]  #{pane_current_command} "
set -ga status-left "#[bg=terminal,fg=#{@thm_overlay_0},none]│"
set -ga status-left "#[fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "

# status right style
set -g status-right-length 100
set -g status-right ""

# Transparent right status bar (without bg option)
# set -ga status-right "#[fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "
set -ga status-right "#{?#{e|>=:10,#{battery_percentage}},#{#bg=#{@thm_red},fg=#{@thm_mantle}]},#{#[bg=#{@thm_mantle},fg=#{@thm_pink}]}} #{battery_icon} #{battery_percentage} "

set -ga status-right "#[bg=#{@thm_mantle},fg=#{@thm_pink}] #{@catppuccin_cpu_icon}#{cpu_percentage} "
set -ga status-right "#[bg=#{@thm_mantle},fg=#{@thm_pink}] #{ram_icon} #{ram_percentage} "

set -ga status-right "#[bg=#{@thm_mantle},fg=#{@thm_overlay_0}, none]│"
# set -ga status-right "#[bg=#{@thm_mantle}]#{?#{==:#{online_status},ok},#[fg=#{@thm_mauve}] 󰖩 on ,#[fg=#{@thm_red},bold]#[reverse] 󰖪 off }"
# set -ga status-right "#[bg=#{@thm_mantle},fg=#{@thm_overlay_0}, none]│"
set -ga status-right "#[bg=#{@thm_mantle},fg=#{@thm_blue}] 󰭦 %Y-%m-%d 󰅐 %H:%M "

# window style
set -wg automatic-rename on
set -g automatic-rename-format ''
set -g window-status-separator '|'
set -g status-justify 'absolute-centre'
set -g @catppuccin_window_status_style 'custom'
set -g @catppuccin_window_flags ""
set -g @catppuccin_window_number ""

# Transparent window style (with bg set to terminal)
set -g @catppuccin_window_text "#[fg=#{@thm_blue},bg=terminal] #I#{?#{!=:#{window_name},},: #W ,}"
# set -g @catppuccin_window_text "#[fg=#{@thm_blue},bg=terminal]  #I #W "


# set -g window-status-current-format "#[fg=$CURRENT_WINDOW_TEXT,bg=$CURRENT_WINDOW_BG]   #I #W  "
# set -g window-status-format "#[fg=$CLOSED_WINDOWS_TEXT,bg=$CLOSED_WINDOWS_BG,nobold,noitalics,nounderscore]  #I #W "
# Default. To make transparent, change value to bg=terminal from all options
# set -g @catppuccin_window_text "#[fg=#{@thm_rosewater},bg=#{@thm_mantle}] #I#{?#{!=:#{window_name},},: #W ,}"

set -g @catppuccin_window_current_number ""
set -g @catppuccin_window_current_text "#[fg=#{@thm_red},bg=#1F2335] #I#{?#{!=:#{window_name},},: #W ,}"
# set -g @catppuccin_window_current_text "#[fg=#{@thm_mantle},bg=#{@thm_red}]  #I #W "
### End theme ###
