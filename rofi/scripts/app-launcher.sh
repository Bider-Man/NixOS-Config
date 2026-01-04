#!/usr/bin/env bash

# Get icon from desktop file
get_icon() {
    local desktop_file="$1"
    local icon_name=""
    
    # Try to get icon from desktop file
    if [ -f "$desktop_file" ]; then
        icon_name=$(grep -E "^Icon=" "$desktop_file" | cut -d'=' -f2)
        
        # If icon is a full path, use it directly
        if [[ "$icon_name" == /* ]]; then
            echo "$icon_name"
            return
        fi
        
        # Try to find icon in theme
        if command -v gtk-icon-theme &> /dev/null; then
            local icon_path=$(gtk-icon-theme -i "$icon_name" -s 64 2>/dev/null | head -1)
            if [ -n "$icon_path" ]; then
                echo "$icon_path"
                return
            fi
        fi
        
        # Fallback to icon name for rofi to handle
        echo "$icon_name"
    fi
}

# Create a custom drun with better icons
create_custom_drun() {
    local apps_dir="/usr/share/applications"
    local local_apps_dir="$HOME/.local/share/applications"
    
    # Collect all desktop files
    find "$apps_dir" "$local_apps_dir" -name "*.desktop" 2>/dev/null | while read -r desktop_file; do
        # Get application name
        app_name=$(grep -E "^Name=" "$desktop_file" | cut -d'=' -f2 | head -1)
        
        # Get comment/description
        app_comment=$(grep -E "^Comment=" "$desktop_file" | cut -d'=' -f2 | head -1)
        
        # Get icon
        app_icon=$(get_icon "$desktop_file")
        
        # Get executable
        app_exec=$(grep -E "^Exec=" "$desktop_file" | cut -d'=' -f2 | head -1)
        
        if [ -n "$app_name" ] && [ -n "$app_exec" ]; then
            # Clean up exec command
            app_exec=$(echo "$app_exec" | sed -e 's/ %[fFuU]//g' -e 's/^"//' -e 's/"$//')
            
            # Output in format for rofi
            if [ -n "$app_icon" ]; then
                printf "%-30s %-50s %s\n" "$app_name" "$app_exec" "$app_icon"
            else
                printf "%-30s %-50s %s\n" "$app_name" "$app_exec" "application-x-executable"
            fi
        fi
    done | sort -u
}

# Run rofi with custom drun
if [ "$1" = "drun" ]; then
    create_custom_drun | rofi -dmenu -p "󰀻 Apps" -theme ~/.config/rofi/config.rasi
else
    rofi -show drun -theme ~/.config/rofi/config.rasi
fi
