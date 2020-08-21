#! /bin/bash

pos=0
player1Pos=0
player2Pos=0

dice(){
	roll=$((RANDOM % 6 + 1))
        echo "You got: $roll"
	choice=$((RANDOM % 3))
	if [ $choice -eq 2 ]
	then
		echo "Ladder"
		pos=$(($pos + $roll))
		Condition
		dice
	elif [ $choice -eq 1 ]
	then
		echo "Snake"
		pos=$(($pos - $roll))
	else
		echo "No play"
	fi
}

Condition(){
	if [ $pos -lt 0 ]
	then
		pos=0
	fi
	if [ $pos -eq 100 ]
	then
		echo "Your position is 100"
		echo "Player $player won!"
		exit
	fi
	if [ $pos -gt 100 ]
	then
		pos=$(($pos - $roll))
	fi
	echo Your position is:$pos
}

Game(){
	while [ $pos -ne 100 ]
	do
		echo "*********Player:$player*********"
		if [ $player -eq 1 ]
		then
			pos=$player1Pos
			dice
			Condition
			player1Pos=$pos
			player=2
		else
			pos=$player2Pos
			dice
			Condition
			player2Pos=$pos
			player=1
		fi
	done
}
Game
