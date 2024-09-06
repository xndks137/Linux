#!/bin/bash

SERVERLIST=/root/tools/server.list

cat $SERVERLIST | while read IP1 uname upass
do
    Cmd() {
        sleep 2 ; echo "$uname"
        sleep 1 ; echo "$upass"
        sleep 1 ; echo 'hostname'
        sleep 1 ; echo 'ls -l'
        sleep 1 ; echo 'exit'
    }
    Cmd | telnet $IP1 

done
