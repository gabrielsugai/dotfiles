# ROSE pine
set -g @rose_pine_variant 'moon' # Options are 'main', 'moon' or 'dawn'

set -g @rose_pine_host 'on' # Enables hostname in the status bar
set -g @rose_pine_date_time '%d/%m %H:%M:%S' # It accepts the date UNIX command format (man date for info)
set -g @rose_pine_user 'off' # Turn on the username component in the statusbar
set -g @rose_pine_directory 'on' # Turn on the current folder component in the status bar
set -g @rose_pine_bar_bg_disable 'off' # Disables background color, for transparent terminal emulators
set -g @rose_pine_bar_bg_disabled_color_option 'default'

set -g @rose_pine_disable_active_window_menu 'on'
set -g @rose_pine_show_current_program 'off' # Forces tmux to show the current running program as window name
set -g @rose_pine_default_window_behavior 'off' # Forces tmux default window list behaviour
set -g @rose_pine_show_pane_directory 'off' # Forces tmux to show the current directory as window name
set -g @rose_pine_left_separator ' > ' # The strings to use as separators are 1-space padded
set -g @rose_pine_right_separator '  ' # Accepts both normal chars & nerdfont icons
set -g @rose_pine_field_separator ' | ' # Again, 1-space padding, it updates with prefix + I
set -g @rose_pine_window_separator ' ' # Replaces the default `:` between the window number and name
# These are not padded
set -g @rose_pine_session_icon '' # Changes the default icon to the left of the session name
set -g @rose_pine_current_window_icon '' # Changes the default icon to the left of the active window name
set -g @rose_pine_folder_icon '' # Changes the default icon to the left of the current directory folder
set -g @rose_pine_username_icon '' # Changes the default icon to the right of the hostname
set -g @rose_pine_hostname_icon '󰒋' # Changes the default icon to the right of the hostname
set -g @rose_pine_date_time_icon '󰃰' # Changes the default icon to the right of the date module
set -g @rose_pine_window_status_separator " " # Changes the default icon that appears between window names
set -g @rose_pine_width_to_hide '80' # Specify a terminal width to toggle off most of the right side functionality
set -g @rose_pine_status_left_prepend_section '#{tmux_mode_indicator}' # Add to the beginning / end of the left and right sections your own.
