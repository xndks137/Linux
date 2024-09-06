#!/bin/bash

# HOSTS=/etc/hosts
HOSTS=hosts
ip=$(ifconfig ens192 | grep 'inet ' | awk '{print $2}' | awk -F. '{print $4}')

for i in $(seq 200 229)
do
    if [ "$i" -eq "$ip" ] ; then continue ; fi
    echo "172.16.6.$i   linux$i.example.com   linux$i" >> $HOSTS
done