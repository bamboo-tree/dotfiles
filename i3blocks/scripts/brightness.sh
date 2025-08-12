#!/bin/bash

value=$(brightnessctl | grep -oP '\(\K[0-9]+(?=%\))')

# Full output
echo "S: ${value}%"
# Short output
echo "${value}%"

# Color
echo "#6C698D"

exit 0
