#!/bin/bash

# Get the project current directory
PROJECT_DIR="$( cd "$(dirname "$0")"|| exit  >/dev/null 2>&1 ; pwd -P )"



# Import the config
source "${PROJECT_DIR}/config"


while true; do
	play "${standUpSound}" & notify-send "bot-pc" "Per piacere alzati :^"

	sleep "${timeStandUp}"m

	play "${standDownSound}" & notify-send "bot-pc" "Ora puoi sederti :)"

	sleep "${timeStandDown}"m
done
