#!/bin/bash

# root disk usage
disk=$(df | grep '/dev/nvme0n1p2' | awk '{print $5}')

# Full output
echo "/: ${disk}"
# Short output
echo "${disk}"

# Change usage indicators
if [ ${disk%?} -ge 80 ]; then
	echo "#1D1E2C"
	echo "#FF1654"
elif [ ${disk%?} -ge 60 ]; then
	echo "#FF1654"
else
	echo "#6C698D"
fi

exit 0
