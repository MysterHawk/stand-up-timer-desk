#!/bin/bash

# Import the config
source config


while true; do
	play "${standUpSound}" & notify-send "bot-pc" "Per piacere alzati :^"

	sleep "${timeStandUp}"m

	play "${standDownSound}" & notify-send "bot-pc" "Ora puoi sederti :)"

	sleep "${timeStandDown}"m
done
