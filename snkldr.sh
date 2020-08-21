#!/bin/bash -x

pos=0

option(){
	choice=$((RANDOM % 3))
	echo $choice
	if [ $choice -eq 2 ]
	then
		echo "Ladder"
		pos=$(($pos + $roll))
	elif [ $choice -eq 1 ]
	then
		echo "Snake"
		pos=$(($pos - $roll))
	else
		echo "No play"
	fi
}

dice(){
	roll=$((RANDOM % 6 + 1))
	echo "You got $roll"
	option
}
dice
