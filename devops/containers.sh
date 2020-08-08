#!/bin/bash

# Author:           Ade Goodyer
# Created:          12/07/2020
# Description:      Collection of functions to manage installation of container related applications
# Tested OS:        Ubuntu 18.04.3-4.14-mate


# Install Docker Odroid
function install_docker {
  ## Get Docker instal script
  # https://www.docker.com/blog/getting-started-with-docker-for-arm-on-linux/
  print_heading "Installing Docker on Odroid"
  curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh

  ## Add user to Docker group
  sudo usermod -aG docker odroid
  newgrp docker # little tip to avoid having to restart system
  
  ## Verify Installation
  docker run hello-world
  docker --version

  print_completion
}

# Install Docker Compose Odroid
function install_docker_compose {
  # Fetch binary and move to /usr/local/bin folder
  sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

  # Make executable
  sudo chmod +x /usr/local/bin/docker-compose

  # Path has been updated so will need to exit existing terminal
  docker-compose --version

  print_completion
}