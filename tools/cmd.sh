#!/bin/bash

NET=192.168.10
SERVER=/root/tools/aliveserver.list
> $SERVER
read CMD
Check() {
    for i in $(seq 10 10 30)
    do
        ping "$NET.$i" -c 1 >/dev/null 2>&1
        if [ $? -eq 0 ] ; then echo "$NET.$i" >> $SERVER ; fi
    done
}

if [ $# -ne 1 ] ; then
do
    echo "Usage: $0 <CMD>"
    exit 1
done

Check
cat << EOF
살아 있는 서버 목록
-----------------------
$(cat $SERVER)
-----------------------
EOF
echo
for i in $SERVER
do
    ssh $i $CMD
done

