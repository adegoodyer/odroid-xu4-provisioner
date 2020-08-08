#!/bin/bash

# Author:           Ade Goodyer
# Created:          12/07/2020
# Description:      Collection of functions to manage installation of version control software
# Tested OS:        Ubuntu 18.04.3-4.14-mate

# Install Git
function install_git {
    print_heading "Installing Git"
    sudo apt install git -y &&
    git config --global user.email "adriangoodyer@gmail.com" &&
    git config --global user.name "adegoodyer"
    print_completion
}