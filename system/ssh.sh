#!/bin/bash

# Author:           Ade Goodyer
# Created:          12/07/2020
# Description:      Collection of functions to manage SSH related tasks
# Tested OS:        Ubuntu 18.04.3-4.14-mate

# Check if existing SSH key exists
function list_ssh_directory {
  ls -al ~/.ssh
}

# Generate new id_rsa SSH key
function genarate_new_ssh_id_rsa {
  print_heading "Attempting new SSH Key Generation.."

  # Install xclip
  sudo apt install xclip -y

  # If no SSH key exists then generate
  if [ -z "$(ls -A ~/.ssh)" ]; then
    # Generate new key
    ssh-keygen -t rsa -b 4096 -C "$1"
    # Start SSH agent
    eval "$(ssh-agent -s)"
    # Add private key to agent
    ssh-add ~/.ssh/id_rsa
    # Copy private key to clipboard
    xclip -sel clip < ~/.ssh/id_rsa.pub
    print_info "SSH Key has been copied to clipboard"

    # Prompt for GitHub integration
    print_user_prompt "Add key to GitHub account: https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account"
    print_completion
  else
    # Halt and notify user
    print_error "No key was generated as an id_rsa file already exists. View file with ls -al ~/.ssh"
  fi
}

# Backup id_rsa SSH key
function backup_ssh_id_rsa {
    filename=~/.ssh/backup-$(date +"%Y-%m-%d-%H.%M.%S")
    mkdir $filename
    cp -r ~/.ssh/id_rsa* $filename
    cp -r ~/.ssh/known_hosts* $filename
}