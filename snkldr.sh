#! /bin/bash
echo "*********************Snake and Ladder Game**************"

startPos=0
finalPos=100
noPlay=1
ladder=2
snake=3

noDice=0
currPos=$startPos
posPlayer1=$startPos
posPlayer2=$startPos

function playerNextMove
{
        currPos=$1
        player=$2
        roll
        ((noDice++))
        case $playerMove in
                $noPlay)
                        currPos=$currPos
                        echo -e "$2\nDice:$dieValue\nMove:No Play\nPosition stays same!\nCurrent postion:$currPos\nPositon after turn:$currPos\n\n"
                        ;;
                $ladder)
                        ladderMoves $player
                        ;;
                $snake)
                        snakeMoves $player
                        ;;
        esac
        printf "Number of dice throws:$noDice\n"
        if (( $currPos == 100 ))
        then
                echo -e "\n$2 wins!"
                exit
        fi
}

function roll()
{
        playerMove=$(( RANDOM%3+1 ))
        dieValue=$(( RANDOM%6+1 ))
}

function ladderMoves()
{
        currPos=$(( $currPos + $dieValue ))
        if (( $currPos > $finalPos ))
        then
                currPos=$(( $currPos - $dieValue ))
        fi
        echo -e "$1\nDice:$dieValue\nMove:Ladder\nPlayer position increased by $dieValue\nCurrent position:$(( $currPos-$dieValue ))\nPositon after turn:$currPos\n\n"
}

function snakeMoves()
{
        echo -e "$1\nDice:$dieValue\nMove:Snake\nPlayer position decreased by $dieValue\nCurrent position:$currPos"
        currPos=$(( $currPos - $dieValue ))
        if (( $currPos < $startPos))
        then
                currPos=$startPos
        fi
        echo -e "Positon after turn:$currPos\n\n"
}

function play()
{
        while (( $posPlayer1 < $finalPos && $posPlayer2 < $finalPos ))
        do
                playerNextMove $posPlayer1 Player1
                posPlayer1=$currPos

		playerNextMove $posPlayer2 Player2
                posPlayer2=$currPos
        done
}

play
