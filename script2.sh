#!/bin/bash

echo "Please enter a date(yyyy-mm-dd)"
read input

DAY="$(date -d $input +'%s')" # user epoch input
TODAY="$(date -d 'now' +'%s')" # today's epoch

DIFF="$(( $(($TODAY - $DAY)) / (60*60*24) ))" # https://stackoverflow.com/questions/4946785/how-to-find-the-difference-in-days-between-two-dates

echo -e "\e[34mThank you!" # https://misc.flogisoft.com/bash/tip_colors_and_formatting

if (( $DIFF >= 0)); then
	echo -e "\e[92m${DIFF} elapsed."
else
	
	echo -e "\e[92m${DIFF#-} remaining." # https://stackoverflow.com/questions/29223313/absolute-value-of-a-number
fi
