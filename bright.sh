#!/bin/bash

path="/sys/class/backlight/amdgpu_bl0/brightness"
CURR_SB="$(cat $path)"
AMOUNT=15
MAX_SB=255
MIN_SB=10

if [ $1 == "H" ]
then
    NEW_SB=$(($CURR_SB+$AMOUNT))
    if [ $NEW_SB -ge $MAX_SB ]
        then
            echo $MAX_SB > $path
    else
        echo $NEW_SB > $path
    fi
fi

if [ $1 == "L" ]
then
    NEW_SB=$(($CURR_SB-$AMOUNT))
    if [ $NEW_SB -le $MIN_SB ]
        then
            echo $MIN_SB > $path
    else
        echo $NEW_SB > $path
    fi
fi
