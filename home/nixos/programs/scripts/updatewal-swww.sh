#!/run/current-system/sw/bin/bash
#  _____ _                           ______        ____        ____        __ 
# |_   _| |__   ___ _ __ ___   ___  / ___\ \      / /\ \      / /\ \      / / 
#   | | | '_ \ / _ \ '_ ` _ \ / _ \ \___ \\ \ /\ / /  \ \ /\ / /  \ \ /\ / /  
#   | | | | | |  __/ | | | | |  __/  ___) |\ V  V /    \ V  V /    \ V  V /   
#   |_| |_| |_|\___|_| |_| |_|\___| |____/  \_/\_/      \_/\_/      \_/\_/    
#                                                                             
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 

# ----------------------------------------------------- 
# Select random wallpaper and create color scheme
# ----------------------------------------------------- 
wal -q -i ~/Pictures/Wallpapers
# ----------------------------------------------------- 
# Load current pywal color scheme
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"

# ----------------------------------------------------- 
# Copy selected wallpaper into .cache folder
# ----------------------------------------------------- 
# cp $wallpaper ~/.cache/current_wallpaper.jpg
cp $wallpaper ~Pictures/Wallpapers/current_wall.jpg
# ----------------------------------------------------- 
# get wallpaper iamge name
# ----------------------------------------------------- 
newwall=$(echo $wallpaper | sed "s|$HOME/Pictures/Wallpapers/||g")

# ----------------------------------------------------- 
# Set the new wallpaper
# ----------------------------------------------------- 
    swww img $wallpaper --transition-type grow --transition-pos 0.854,0.977 --transition-step 90 --transition-fps=144
~/dotfiles/waybar/launch.sh
sleep 1

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
notify-send "Colors and Wallpaper updated" "with image $newwall"

echo "DONE!"
