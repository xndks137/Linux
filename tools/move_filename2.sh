#!/bin/bash

D_WORK=$1       	# working directory
T_FILE1=/tmp/.tmp1  	# tempory file1

if [ $# -ne 1 ] ; then
    echo "Usage: $0 <directory>"
    exit 1
fi

SRCEXT="els"
DSTEXT="txt"

ls -1 $D_WORK | grep ".$SRCEXT$" > $T_FILE1

for FILE in `cat $T_FILE1`
do
    mv $D_WORK/$FILE `echo $D_WORK/$FILE | sed "s/.$SRCEXT$/.$DSTEXT/g"`
done