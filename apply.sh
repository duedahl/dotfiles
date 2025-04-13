#!/usr/bin/env bash
# Define dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check for stow
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow not found. Please install it first."
    exit 1
fi

echo "Activating dotfiles from $DOTFILES_DIR..."

# Get all package directories
PACKAGES=$(find "$DOTFILES_DIR" -mindepth 1 -maxdepth 1 -type d -not -path "*/\.*" -not -path "*/\.git*" -printf "%f\n")

# Activate each package
for PACKAGE in $PACKAGES; do
    echo "Activating $PACKAGE..."
    
    # Use --verbose to see exactly what's happening
    # Use --no-folding to ensure all directories are fully symlinked
    # Use -R to restow (remove and then stow again)
    stow -d "$DOTFILES_DIR" -t "$HOME" --verbose --no-folding -R "$PACKAGE"
    
    # Check result
    if [ $? -eq 0 ]; then
        echo "Activated $PACKAGE successfully"
    else
        echo "Failed to activate $PACKAGE"
        # Optional: add --adopt if you want to replace existing files
        # echo "Trying again with --adopt..."
        # stow -d "$DOTFILES_DIR" -t "$HOME" --verbose --no-folding --adopt "$PACKAGE"
    fi
done

echo "All dotfiles activated"

# Refresh current session
if [ -n "$BASH_VERSION" ]; then
    echo "Refreshing bash session..."
    source "$HOME/.bashrc"
elif [ -n "$ZSH_VERSION" ]; then
    echo "Refreshing zsh session..."
    source "$HOME/.zshrc"
elif [ -n "$NU_VERSION" ] || command -v nu &> /dev/null; then
    echo "Refreshing nushell session..."
    nu -c "source \$nu.config-path; source \$nu.env-path"
else
    echo "Shell type not detected. You may need to restart your shell to apply changes."
fi

echo "Done."
