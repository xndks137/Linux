#!/bin/bash

MAX=5
AST=" "

for i in $(seq 1 5)
do
    for j in "$(expr $MAX - $i)"
    do
        AST="$AST "
    done
    AST="$AST*"
    echo "$AST"
done
