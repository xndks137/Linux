#!/bin/bash -e
# 1. telnet 서비스
# 2. vsftpd 서비스

source /root/tools/function.sh

#=======================
# 1. telnet
# (ㄱ) 패키지 설치
# (ㄴ) 서비스 설정
# (ㄷ) 서비스 기동
# (ㄹ) 방화벽 등록

# 2. vsftpd
# (ㄱ) 패키지 설치
# (ㄴ) 서비스 설정
# (ㄷ) 서비스 기동
# (ㄹ) 방화벽 등록
#=======================

# 1. telnet
echo "[ INFO ] telnet 서비스 설치"

# (ㄱ) 패키지 설치
yum -y -q install $PKG_TELNET
echo "[  OK  ] 패키지 설치: $PKG_TELNET"

# (ㄴ) 서비스 설정

# (ㄷ) 서비스 기동
systemctl enable --now $SVC_TELNET
echo "[  OK  ] 서비스 기동: $SVC_TELNET"

# (ㄹ) 방화벽 등록
FWCMD --add-service=$FW_TELNET >/dev/null 2>&1
echo "[  OK  ] 방화벽 등록: $FW_TELNET"
echo "[ INFO ] telnet 서비스 설치 완료"
echo

# 2. vsftpd
echo "[ INFO ] ftp 서비스 설치"

# (ㄱ) 패키지 설치
yum -y -q install $PKG_FTP
echo "[  OK  ] 패키지 설치: $PKG_FTP"

# (ㄴ) 서비스 설정
sed -i 's/^root//' $CONF_FTP_FTPUSERS
sed -i 's/^root//' $CONF_FTP_USER_LIST
echo "[  OK  ] 서비스 설정: $CONF_FTP_FTPUSERS $CONF_FTP_USER_LIST"

# (ㄷ) 서비스 기동
systemctl enable --now $SVC_FTP
echo "[  OK  ] 서비스 기동: $SVC_FTP"

# (ㄹ) 방화벽 등록
FWCMD --add-service=$FW_FTP >/dev/null 2>&1
echo "[  OK  ] 방화벽 등록: $FW_FTP"
echo "[ INFO ] ftp 서비스 설치 완료"
echo
