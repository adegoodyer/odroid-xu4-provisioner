#!/bin.bash

# Author:           Ade Goodyer
# Created:          12/07/2020
# Description:      Collection of functions to manage the behaviour of the terminal
# Tested OS:        Ubuntu 18.04.3-4.14-mate

# Enable BASH incremental history search
function enable_incremental_search {
    sudo echo '"\e[A": history-search-backward
    "\e[B": history-search-forward
    "\e[C": forward-char
    "\e[D": backward-char' >> ~/.inputrc
}

# Backing up, resetting and restoring GNOME Terminal preferences using dconf
# https://askubuntu.com/questions/967517/backup-gnome-terminal

# Backup GNOME terminal settings
function backup_terminal_preferences {
  print_heading "Backing up GNOME Terminal preferences"
  dconf dump /org/gnome/terminal/ > backup/gnome_terminal_settings_backup.txt
  print_info "Backed up to backup/gnome_terminal_settings_backup.txt"
  print_info "Don't forget to commit changes to version control"
  print_completion
}

# Reset GNOME terminal settings
function reset_terminal_preferences {
  print_heading "Resetting GNOME Terminal preferences"
  dconf reset -f /org/gnome/terminal/
  print_completion
}

# Load GNOME terminal settings
function load_terminal_preferences {
  print_heading "Loading GNOME terminal preferences"
  dconf load /org/gnome/terminal/ < backup/gnome_terminal_settings_backup.txt
  print_completion
}
