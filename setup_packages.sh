#!/bin/bash

# APT update and upgrade
sudo apt update
sudo apt upgrade -y

# APT installations
sudo apt install -y \
    git

# Curl installations
[ ! -e $(command -v brew) ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
[ ! -e $(command -v starship) ] && /bin/sh -c "$(curl -sS https://starship.rs/install.sh)"