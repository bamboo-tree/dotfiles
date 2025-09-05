#!/bin/bash

# Get date and time
day=$(date '+%d')
dayOfWeek=$(date '+%u')
time=$(date '+%H:%M')

case $dayOfWeek in
	1)
		dayOfWeek="Mon"
		;;
	2)
		dayOfWeek="Tue"
		;;
	3)
		dayOfWeek="Wed"
		;;
	4)
		dayOfWeek="Thu"
		;;
	5)
		dayOfWeek="Fri"
		;;
	6)
		dayOfWeek="Sat"
		;;
	7)
		dayOfWeek="Sun"
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
