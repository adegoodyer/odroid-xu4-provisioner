#!/bin/bash

# Author:           Ade Goodyer
# Created:          15/07/2020
# Description:      Add aliases to BASH in one handy shell script

#
append_unique_line 'alias c="clear"' ~/.bashrc

# Git
append_unique_line 'alias gs="clear && git status"' ~/.bashrc
append_unique_line 'alias gl="clear && git log --oneline"' ~/.bashrc

print_info "Your additional aliases have been set. View with the alias command"