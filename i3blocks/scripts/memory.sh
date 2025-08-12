#!/bin/bash

# Memory usage
memory=$(free -m | grep Mem | awk '{printf "%.1f\n", ($3/$2)*100}')

# Full output
echo "M: ${memory}%"
# Short output
echo "${memory}"

# Change usage indicators
if (( $(echo "$memory >= 80" | bc -l) )); then
	echo "#1D1E2C"
	echo "#FF1654"
elif (( $(echo "$memory >= 60" | bc -l) )); then
	echo "#FF1654"
else
	echo "#6C698D"
fi

exit 0
