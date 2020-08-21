#!/bin/bash -x

pos=0
declare -A game
rollCount=1

option(){
	choice=$((RANDOM % 3))
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
  echo "You got : $roll"
  option
}

while [ $pos -le 100 ]
do
	echo $rollCount
	dice
	if [ $pos -lt 0 ]
	then
		pos=0
	fi
	if [ $pos -eq 100 ]
	then
		game[$rollCount]=100
		echo "Your position is 100"
		echo "You have won!"
		exit
	fi
	if [ $pos -gt 100 ]
	then
		pos=$(($pos - $roll))
	fi
	game[$rollCount]=$pos
	echo "Your position is: $pos"
	rollCount=$(($rollCount + 1))
done
