#!/bin.bash

# Author:           Ade Goodyer
# Created:          12/07/2020
# Description:      Collection of functions to manage installation of security related applications
# Tested OS:        Ubuntu 18.04.3-4.14-mate

 # Enable firewall
function enable_firewall {
  print_heading "Enabling Firewall"
  
  # fix /usr being owned by odroid user https://forum.odroid.com/viewtopic.php?t=32687
  sudo chown root:root /usr 
  sudo chmod g-w /usr
  # Enable firewall
  sudo ufw enable

  # Add rule to allow connection form workstation
  sudo ufw allow from 192.168.0.3 to any port 22

  print_completion
}