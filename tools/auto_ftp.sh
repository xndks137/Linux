#!/bin/bash

SERVERLIST=/root/tools/server.txt
FILE=/root/tools/linux217.txt

for IP in $(cat $SERVERLIST)
do

    ftp -n "$IP" 21 << EOF
    user root centos
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mput $FILE
    quit
EOF

done
