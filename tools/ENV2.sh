#!/bin/bash

source /root/tools/function.sh

echo "[ INFO ][시작] 설정"
/bin/cp -p $CONF_BASHRC_TEMP $CONF_BASHRC
echo "[  OK  ] 환경 파일 설정: $CONF_BASHRC"
echo "[ INFO ][끝] 설정"
echo