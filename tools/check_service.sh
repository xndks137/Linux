#!/bin/bash

TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3

systemctl -t service \
	| awk '{print $1, $3}' \
	| sed -n '2,/LOAD/p' \
	| sed '$d' > $TMP1

ssh 192.168.10.30 systemctl -t service \
	| awk '{print $1, $3}' \
	| sed -n '2,/LOAD/p' \
	| sed '$d' > $TMP2

diff $TMP1 $TMP2 > $TMP3

echo "-------내서버-------"
cat $TMP3 | fgrep '<' | cut -c2-
echo

echo "--------쟤서버-------"
cat $TMP3 | fgrep '>' | cut -c2-
echo