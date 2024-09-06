#!/bin/bash

# HOSTS=/etc/hosts
HOSTS=hosts

for i in $(seq 200 229)
do
    echo "172.16.6.$i   linux$i.example.com   linux$i" >> $HOSTS
done