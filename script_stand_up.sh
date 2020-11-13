#!/bin/bash

# Get the project current directory
PROJECT_DIR="$( cd "$(dirname "$0")"|| exit  >/dev/null 2>&1 ; pwd -P )"

# Import the config
source "${PROJECT_DIR}/config"

# Language switch for description
# The second part (sed...) is needed to remove the double quotes at the beginning/end of the descriptions
descriptionStandUp=$(jq ".${language}[0].descriptionStandUp" "${PROJECT_DIR}"/languages.json | sed -e 's/^"//' -e 's/"$//')
descriptionStandDown=$(jq ".${language}[1].descriptionStandDown" "${PROJECT_DIR}"/languages.json | sed -e 's/^"//' -e 's/"$//') 

#If the descriptions are NULL then your language isnt supported
if [ "${descriptionStandUp}" = "null" ] && [ "${descriptionStandDown}" = "null" ]
then
	echo "Your language translation isn't supported or you have a typo in the language selector string"
	exit 1
fi

# Begin the cycle
while true; do
	play "${standUpSound}" & notify-send "bot-pc" "${descriptionStandUp} :^"

	sleep "${timeStandUp}"m

	play "${standDownSound}" & notify-send "bot-pc" "${descriptionStandDown} :)"

	sleep "${timeStandDown}"m
done
