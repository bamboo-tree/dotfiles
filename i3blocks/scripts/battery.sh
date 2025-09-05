#!/bin/bash

flag=$(acpi -b | grep -E -o '[CD]')
battery=$(acpi -b | grep -E -o '[1]?[0-9][0-9]?%')
remaining=$(acpi -b | grep -E -o '\s[0-9][0-9]:[0-9][0-9]?')

if [ ${flag} != 'C' ]; then
	flag='B'
fi

# Full output
echo "${flag}: ${battery}${remaining}"
# Short output
echo "${battery}"

# Set color indicators
if [ ${flag} = 'B' ]; then
	if [ ${battery%?} -le 20 ]; then
		echo "#1D1E2C"
		echo "#FF1654"
	elif [ ${battery%?} -le 30 ]; then
		echo "#FF1654"
	else
		echo "#CB9CF2"
	fi
else
	if [ ${battery%?} -ge 100 ]; then
		echo "#1D1E2C"
		echo "#7BE0AD"
	elif [ ${battery%?} -ge 90 ]; then
		echo "#7BE0AD"
	else
		echo "#7BE0AD"
	fi
fi

exit 0
