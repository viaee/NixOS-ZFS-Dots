{ config, pkgs, ... }:

{
 home.file.".config/kitty/kitty.conf".text = ''
include  /home/vi/.cache/wal/colors-kitty.conf

# Fonts
font_family	JetBrainsMono Nerd Font
font_size	9.5
mouse_hide_wait	3.0

# Close Message
confirm_os_window_close 0

# Performance
sync_to_monitor	no
repaint_delay	1
input_delay	1
disable_ligatures	never

# URL
url_color #fff
url_style curly

# Telemetry
update_check_interval 0

# Scrolling
wheel_scrool_multiplayer	10

# Wayland
linux_display_server wayland
'';
}
