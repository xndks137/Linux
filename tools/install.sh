#!/bin/bash

NUM=1

asd="="
asd1="=>"
percent=10

while [ $NUM -le 10 ]
do
    echo -ne "\r$percent% | $asd"
    sleep 1 
    NUM=`expr $NUM + 1`
    asd1=$(echo -ne "$asd $asd1")
    percent=`expr $percent + 10`
done

if [ $NUM -eq 10 ] ; then
    echo -ne '| complete'
fi
