#!/bin/bash
# EndeavourOS User Commands (Phase 2: After Installation)
# Place this file at: /home/liveuser/user_commands.bash

set -e

USERNAME="$1"  # Passed by Calamares
USER_HOME="/home/$USERNAME"

echo "Starting EndeavourOS post-installation automation for user: $USERNAME"

# Set up dotfiles repository
if [ ! -d "$USER_HOME/Public/dotfiles" ]; then
    echo "Cloning dotfiles repository..."
    sudo -u "$USERNAME" git clone https://github.com/yourusername/dotfiles.git "$USER_HOME/Public/dotfiles"
fi

# Install dotfiles with stow
cd "$USER_HOME/Public/dotfiles"
echo "Installing dotfiles with GNU Stow..."
sudo -u "$USERNAME" stow -v -t "$USER_HOME" x11 shell wm terminal editors apps scripts

# Install system configurations
echo "Installing system configurations..."
stow -v -t / system

# Change default shell to zsh
echo "Setting zsh as default shell for $USERNAME"
chsh -s "$(which zsh)" "$USERNAME"

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sudo -u "$USERNAME" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Nerd Fonts
echo "Installing Nerd Fonts..."
if command -v getnf &> /dev/null; then
    sudo -u "$USERNAME" getnf -i Noto
fi

# Enable betterlockscreen service
echo "Enabling betterlockscreen service..."
systemctl enable "betterlockscreen@$USERNAME"

# Install cht.sh
echo "Installing cht.sh..."
curl -s https://cht.sh/:cht.sh | tee /usr/local/bin/cht.sh
chmod +x /usr/local/bin/cht.sh

# Set proper ownership
chown -R "$USERNAME:$USERNAME" "$USER_HOME"

echo "EndeavourOS automation completed successfully!"
echo "Reboot and log back in to complete setup."