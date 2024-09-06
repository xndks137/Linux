#!/bin/bash

USERLIST=/root/tools/user.list
> $USERLIST 

for i in $(seq 1 100)
do
    echo "user$i   user$i" >> $USERLIST
done