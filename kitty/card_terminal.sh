#!/bin/bash

# Path to your cat pictures folder - CHANGE THIS!
CAT_FOLDER="$HOME/.config/me/cards/"

# Create folder if it doesn't exist
mkdir -p "$CAT_FOLDER"

# Dependencies check
check_dependencies() {
    command -v kitty >/dev/null 2>&1 || { echo "Kitty terminal required but not installed."; exit 1; # Main function
main() {
    check_dependencies
    
    # Get random image
    IMAGE=$(get_random_image)
    
    # Display image and apply colors
    display_and_apply_colors "$IMAGE"
}

main
    command -v wal >/dev/null 2>&1 || { echo "Pywal required but not installed. Install with 'pip install pywal' or equivalent."; exit 1; }
}

# Get a random image from the folder
get_random_image() {
    # Check if there are any images in the folder
    if [ -z "$(ls -A "$CAT_FOLDER"/*.{jpg,jpeg,png,gif} 2>/dev/null)" ]; then
        echo "No images found in $CAT_FOLDER. Please add some cat pictures!"
        exit 1
    fi
    
    # Select a random image
    local images=("$CAT_FOLDER"/*.{jpg,jpeg,png,gif})
    # Remove any nullglob patterns that didn't match
    images=(${images[@]%%\**})
    
    # Get a random image from the array
    local random_index=$((RANDOM % ${#images[@]}))
    echo "${images[$random_index]}"
}

# Display image and apply colors using pywal
display_and_apply_colors() {
    local image="$1"
    
    # Use kitty's icat to display the image
    kitty +kitten icat --align center "$image"
    
    # Use pywal to set the color scheme based on the image
    wal -i "$image" -n -q
    
    # Apply pywal colors to kitty if needed
    # Kitty should automatically pick up the colors if configured properly
    # but we can force it to reload
    kitty @ set-colors --all ~/.cache/wal/colors-kitty.conf
    
    echo "Applied color scheme from: $(basename "$image")"
}rgb[2]})
