#!/bin/bash

# Author:           Ade Goodyer
# Created:          12/07/2020
# Description:      Collection of functions to manage installation of audio and video components
# Tested OS:        Ubuntu 18.04.3-4.14-mate

# Install vlc media player
function install_vlc {
    print_heading "Installing VLC Player"
    sudo snap install vlc
    print_completion
}

# Install media codecs
function install_media_codecs {
    print_heading "Installing Media Codecs"
    sudo apt install ubuntu-restricted-extras -y
    print_completion
}

# Install Kodi media player
function install_kodi {
    # https://magazine.odroid.com/article/kodi-and-advanced-mame-on-odroid-xu4-part-1/

    print_heading "Installing Kodi"

    # Install Kodi
    sudo apt install kodi kodi-bin kodi-data libcec4 python-libcec openbox
    sudo apt install git cmake xorg-dev gcc g++ build-essential
    
    # Install gl4es
    git clone https://github.com/ptitSeb/gl4es.git
    cd gl4es
    mkdir build
    cd build
    cmake .. -DODROID=1
    make
    sudo mv /usr/lib/arm-linux-gnueabihf/libGL.so.1 /usr/lib/arm-linux-gnueabihf/save.libGL.so.1
    sudo mv /usr/lib/arm-linux-gnueabihf/libGL.so.1.0.0 /usr/lib/arm-linux-gnueabihf/save.libGL.so.1.0.0
    sudo cp ../lib/libGL.so.1 /usr/lib/arm-linux-gnueabihf/
    sudo ldconfig

    # Check install
    glxinfo | head -6
    print_info "LIBGL: Initialising gl4es
LIBGL: v1.1.1 built on Mar 28 2019 06:22:26
LIBGL: Using GLES 2.0 backend
LIBGL: loaded: libGLESv2.so
LIBGL: loaded: libEGL.so
LIBGL: Using GLES 2.0 backend"

    print_user_prompt "Does the output of glx info match the above"

    # Setup Kodi
    sudo adduser --disabled-password --gecos "" kodi
    sudo usermod -a -G cdrom,video,plugdev,users,dialout,dip,input,netdev,audio,pulse,pulse-access,games kodi
    sudo sed -ie 's/allowed_users=console/allowed_users=anybody/g' /etc/X11/Xwrapper.config
    sudo sed -ie "\$aneeds_root_rights = yes" /etc/X11/Xwrapper.config
    print_info "Add the following to /etc/systemd/system/kodi.service"
    print_info "[Unit]
 Description = Kodi Media Center
 After = systemd-user-sessions.service network.target sound.target mysql.service dbus.service polkit.service upower.service
 Wants = mysql.service
 [Service]
 User = kodi
 Group = kodi
 Type = simple
 #PAMName = login # you might want to try this one, did not work on all systems
 ExecStart = /usr/bin/xinit /usr/bin/dbus-launch --exit-with-session openbox --startup /usr/bin/kodi-standalone -- :0 -nolisten tcp vt7
 Restart = on-abort
 RestartSec = 5

 [Install]
 WantedBy = multi-user.target"

    # Enable Kodi at boot
    sudo systemctl enable kodi
    sudo systemctl set-default multi-user.target
    
    # Fix Mali GPU access bug
    sudo apt install mali-x11 --reinstall

    print_completion
}