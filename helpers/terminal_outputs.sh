#!/bin/bash

# Author:           Ade Goodyer
# Created:          12/07/2020
# Description:      Collection of functions to display textual messages in the terminal

# Change terminal text colour via ANSI codes
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

# Print heading
function print_heading {	
	echo
	echo -e "${LBLUE}*******************************************${NC}"
	echo -e "**   $1..."
	echo -e "${LBLUE}*******************************************${NC}"
	echo
}

# Print Completion
function print_completion {
	echo
	echo -e "${GREEN}*****************"
	echo -e "** COMPLETED!  **"
	echo -e "${GREEN}*****************${NC}"
	echo
}

# Print Error
function print_error {
	echo
	echo -e "${RED}*************"
	echo -e "** ERROR!  **"
	echo -e "${RED}*************"
	echo
	echo -e "$1${NC}"
	echo
}

# Print User Prompt
function print_info {
	echo
	echo -e "${LBLUE}$1..${NC}"
    echo 
}

# Print User Prompt
function print_user_prompt {
	echo
	echo -e "${YELLOW}$1"
    echo 
    echo -e "${YELLOW}Press any key to Continue..${NC}"
    read
}

# Print colour samples
function print_color_samples {
    echo -e "${BLACK}******BLACK******"
    echo -e "${RED}******RED******"
    echo -e "${GREEN}******GREEN******"
    echo -e "${ORANGE}******ORANGE******"
    echo -e "${BLUE}******BLUE******"
    echo -e "${PURPLE}******PURPLE******"
    echo -e "${CYAN}******CYAN******"
    echo -e "${LGRAY}******LGRAY******"

    echo -e "${DGRAY}******DGRAY******"
    echo -e "${LRED}******LRED******"
    echo -e "${LGREEN}******LGREEN******"
    echo -e "${YELLOW}******YELLOW******"
    echo -e "${LBLUE}******LBLUE******"
    echo -e "${LPURPLE}******LPURPLE******"
    echo -e "${LCYAN}******LCYAN******"
    echo -e "${WHITE}******WHITE******"

    echo -e "${NC}******NO COLOR******"
}