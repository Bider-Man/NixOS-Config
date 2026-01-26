# My NixOS Config

After copying the quickshell config, run these commands:

'''cd ~/.config/quickshell/ii/scripts/colors/

# Create output directory
mkdir -p ~/.local/state/quickshell/user/generated/

# Generate colors from default wallpaper
python3 generate_colors_material.py --path ../../assets/images/default_wallpaper.png

# Or from your own wallpaper
python3 generate_colors_material.py --path /path/to/your/wallpaper.png

# Apply the generated colors
./applycolor.sh
'''
