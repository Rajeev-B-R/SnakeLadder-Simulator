#!/bin/bash -x

pos=0
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
	dice
	if [ $pos -lt 0 ]
	then
		pos=0
	fi
	echo "Your position:$pos"
done
echo "You won the game"
