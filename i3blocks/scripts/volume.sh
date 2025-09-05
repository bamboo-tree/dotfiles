#!/bin/bash

# root disk usage
volume=$(pactl get-sink-volume 0 | awk '{print $5}')
mute_status=$(pactl get-sink-mute 0 | awk '{print $2}')


if [ ${mute_status} == 'no' ]; then
	# No mute
	# Full output
	echo "A: $volume"
	# Short output
	echo "A: $volume"
	# Color
	echo "#6C698D"
else
  # Mute
	# Full output
	echo "M: $volume"
	# Short output
	echo "M: $volume"
	# Color
	echo "#CB9CF2"
fi

exit 0
