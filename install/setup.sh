#!/bin/bash
#
# WSL setup script
# Font: https://github.com/samuelramox/wsl-setup
# Main install script

source ./install/utils.sh
keep_sudo_alive

# Add current user to sudoers file
#echo "stanwar  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Create Directories
e_header "Creating shareddata directory in Home"
mkdir ${HOME}/shareddata

# Install applications
e_warning "Warning: This step install applications."
bash ./install/apps.sh


# Dotfiles configs
e_warning "Warning: This step may overwrite your existing dotfiles and git configs."
bash ./install/dotfiles.sh






# Cleanup cached downloads and remove the installation zip and folder
e_header "Removing unnecessary files"
sudo apt -y autoremove
rm -rf ${HOME}/wsl-setup.tar.gz
rm -rf ${HOME}/wsl-setup.zip
#rm -rf ${DOTFILES_DIRECTORY}

# Finish
e_success "Reboot and enjoy!"
