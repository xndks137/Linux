#!/bin/bash

BASE=/test
mkdir -p $BASE && rm -rf $BASE/*

for i in $(seq 1 4)
do
    for j in $(seq 1 4)
    do
        mkdir -p $BASE/"$i"/"$j"
    done
done
tree $BASE