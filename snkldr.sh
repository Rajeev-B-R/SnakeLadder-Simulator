#!/bin/bash -x

pos=0
dice()
{
	roll=$((RANDOM % 6 + 1))
	echo "You got $roll"
}
dice
