#!/bin/bash

# Get date and time
day=$(date '+%d')
dayOfWeek=$(date '+%u')
time=$(date '+%H:%M:%S')

case $dayOfWeek in
	1)
		dayOfWeek="MON"
		;;
	2)
		dayOfWeek="TUE"
		;;
	3)
		dayOfWeek="WED"
		;;
	4)
		dayOfWeek="THU"
		;;
	5)
		dayOfWeek="FRI"
		;;
	6)
		dayOfWeek="SAT"
		;;
	7)
		dayOfWeek="SUN"
		;;
	*)
		;;
esac

# Full output
echo "${day} ${dayOfWeek} ${time}"
# Short output
echo "${time}"

# Color
echo "#F0E6EF"

exit 0
