#!/bin/bash

city="Lublin"
# Fetch weather data 
weather=$(curl -s "wttr.in/${CITY}?format=%t")

# Full output
echo "W: $weather"
# Short output
echo "$weather"

# Color
echo "#6C698D"

exit 0
