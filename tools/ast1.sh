#!/bin/bash

for i in $(seq 1 5)
do
    for j in $i
    do
        AST="$AST *"
        echo "$AST"
    done
done