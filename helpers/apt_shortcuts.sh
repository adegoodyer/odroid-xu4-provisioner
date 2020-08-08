#!/bin/bash

# Author:           Ade Goodyer
# Created:          12/07/2020
# Description:      Collection of functions that call shorcut apt commands

# Update system
function system_update {
  print_heading "Updating System"
  sudo apt update -y
  print_completion
}

# Upgrade system
function system_upgrade {
  print_heading "Upgrading System"
  sudo apt dist-upgrade -y
  print_completion
}

# Cleanup system
function system_cleanup {
	print_heading "Cleaning System"
	sudo apt autoremove -y
	print_completion
}