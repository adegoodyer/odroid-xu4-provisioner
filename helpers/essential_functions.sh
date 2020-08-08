#!/bin/bash

# Author:           Ade Goodyer
# Created:          16/07/2020
# Description:      Collection of essential functions to perform actions on Linux systems

# Append line to file, only if it hasn't already been
# https://stackoverflow.com/questions/3557037/appending-a-line-to-a-file-only-if-it-does-not-already-exist
function append_unique_line {
    # grep -qxF 'include "/configs/projectname.conf"' foo.bar || echo 'include "/configs/projectname.conf"' >> foo.bar
    grep -qxF "$1" "$2" || echo "$1" >> "$2"
}