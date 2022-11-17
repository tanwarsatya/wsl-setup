#!/bin/bash
#
# Install Zsh and set as default shell
# Install dotfiles and configure git

source ./install/utils.sh
keep_sudo_alive

# Install Zsh:
sudo apt -y install zsh

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install P10K Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set Zsh as your default shell:
chsh -s /bin/zsh

# Move/replace setting files to /Home
replace ".gitconfig"        ".gitconfig"
replace ".gitignore_global" ".gitignore_global"
replace ".zshrc"            ".zshrc"
replace ".p10k.zsh"            ".p10k.zsh"

# Git configs
e_header "Configure your Git settings: "
nano ${HOME}/.gitconfig

# Finish
e_success "Dotfiles update complete."
