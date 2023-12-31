#!/run/current-system/sw/bin/bash
# __        __    _ _                              
# \ \      / /_ _| | |_ __   __ _ _ __   ___ _ __  
#  \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__| 
#   \ V  V / (_| | | | |_) | (_| | |_) |  __/ |    
#    \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|    
#                    |_|         |_|               
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 

# Select wallpaper

selected=$(ls -1  ~/Pictures/Wallpapers/ | grep 'jpg\|png\|gif'| rofi -dmenu -p "Wallpapers")
if [ "$selected" ]; then

    echo "Changing theme..."
    # Update wallpaper with pywal
    wal -q -i ~/Pictures/Wallpapers/$selected

    # Wait for 1 sec
    sleep 1

    # Reload qtile to color bar
    qtile cmd-obj -o cmd -f reload_config

    # Get new theme
    source "$HOME/.cache/wal/colors.sh"

    newwall=$(echo $wallpaper | sed "s|$HOME/Pictures/Wallpapers/||g")
    sleep 1

    # Send notification
    notify-send "Colors and Wallpaper updated" "with image $newwall"

    echo "Done."
fi
