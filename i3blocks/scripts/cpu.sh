#!/bin/bash

# Total CPU usage
cpu=$(mpstat | grep all | awk '{printf "%.1f\n", (100 - $13)}')

# Full output
echo "CPU: ${cpu}%"
# Short output
echo "${cpu}"

# Change usage indicators
if (( $(echo "$cpu >= 80" | bc -l) )); then
	echo "#1D1E2C"
	echo "#FF1654"
elif (( $(echo "$cpu >= 60" | bc -l) )); then
	echo "#FF1654"
else
	echo "#6C698D"
fi

exit 0
