#!/bin/bash
. config/import_all.sh

# Author:           Ade Goodyer
# Created:          14/07/2020
# Description:      Installation script to setup Odroid system as a media center for the living room.
# OS Version:       Ubuntu 18.04.3-4.14-mate

# System prep
system_update
system_upgrade

# System basics
install_media_codecs
install_vlc

# Setup terminal
enable_incremental_search
load_terminal_preferences

# Install container tools
install_docker
install_docker_compose

# Install media centre tools
install_media_codecs
install_kodi

# Clean system before finishing
system_cleanup