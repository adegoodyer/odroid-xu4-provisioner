#!/bin/bash

# Author:           Ade Goodyer
# Created:          12/07/2020
# Description:      Collection of functions to manage installation of audio and video components
# Tested OS:        Ubuntu 18.04.3-4.14-mate

# LCD Setup
function install_cloudshell_lcd {
    print_heading "Installing Cloudshell LCD"

    sudo -s
    echo "options fbtft_device name=hktft9340 busnum=1 rotate=270" > /etc/modprobe.d/odroid-cloudshell.conf
    echo "spi_s3c64xx" >> /etc/modules
    echo "spidev" >> /etc/modules
    echo "fbtft_device" >> /etc/modules

    # Comment out the required lines
    # SPI
    # blacklist spidev
    # blacklist spi_s3c64xx
    print_user_prompt "Comment out the lines - SPI, blacklist spidev and blacklist spi_s3c64xx"

    nano /etc/modprobe.d/blacklist-odroid.conf

    # Essential to fix LCD white screen
    # https://forum.odroid.com/viewtopic.php?t=34687

    print_user_prompt "Change the line to match - options fbtft_device name=hktft9340 busnum=1 rotate=270 speed=35000000"

    nano /etc/modprobe.d/odroid-cloudshell.conf

    print_user_prompt "Now setup and install cloud server script - You will need to build this first as existing ones don't work under the current version of Ubuntu"

    # Install lcd_server #1
    # sudo apt-get install curl sysstat
    # wget https://raw.githubusercontent.com/mdrjr/cloudshell_lcd/master/cloudshell-lcd_20160913-3_armhf.deb
    # sudo dpkg -i cloudshell-lcd_20160913-3_armhf.deb

    # Install lcd_server #2
    # sudo apt-get install curl sysstat
    # wget https://github.com/leeseungcheol/cloudshell-lcd/raw/master/cloudshell-lcd_20170420-4_armhf.deb
    # sudo dpkg -i cloudshell-lcd_20170420-4_armhf.deb

    print_completion
}