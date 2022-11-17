#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./install/utils.sh
keep_sudo_alive

# Update Ubuntu
sudo apt update
sudo apt upgrade -y

# Essential package
sudo apt -y install build-essential

# Git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt -y update
sudo apt -y install git

# Ubuntu WSL
# Check out https://github.com/wslutilities/wslufor more details
sudo apt install ubuntu-wsl


# Install go sdk
wget -q -O - https://git.io/vQhTU | bash -s -- --version 1.19.3

#Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install terraform
# ------------------------------------------------------
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform
# ------------------------------

# Finish
e_success "Finished applications installation."
