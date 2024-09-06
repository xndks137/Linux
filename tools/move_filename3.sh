#!/bin/bash

T_FILE1=/tmp/.tmp1  	# tempory file1
D_WORK=$1       	# working directory
SRCEXT=$2
DSTEXT=$3

if [ $# -ne 3 ] ; then
    echo "Usage: $0 <directory> <SRCEXT> <DSTEXT>"
    exit 1
fi

ls -1 $D_WORK | grep ".$SRCEXT$" > $T_FILE1

for FILE in `cat $T_FILE1`
do
    mv $D_WORK/$FILE `echo $D_WORK/$FILE | sed "s/.$SRCEXT$/.$DSTEXT/g"`
done
ls /test
