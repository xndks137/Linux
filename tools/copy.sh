#!/bin/bash
set -e

NET=192.168.10
SERVER=/root/tools/aliveserver.list
> $SERVER

if [ $# -ne 2 ] ; then
    echo "Usage: $0 <src> <dst>"
    exit 1
fi

src=$1
dst=$2

Title(){
cat << EOF
################
# $1
################
EOF
}

cat $SERVER | while read ip
do
    Title $ip
    scp "$src" "$ip:$dst"
done


