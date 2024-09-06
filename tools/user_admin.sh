#!/bin/bash

# Variable Definitions
TMP1=/tmp/tmp1

# Function Definitions
Menu(){
cat << EOF 
(관리 목록)
-----------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
-----------------------
EOF
}

UserAdd(){
echo "(사용자 추가) "
echo -n "추가할 사용자 이름? : "
read addname
grep $addname /etc/passwd >/dev/null 2>&1
if [ $? -eq 0 ]; then
    addresult="이미 있는 사용자입니다."
elif [ $? -eq 1 ]; then
    useradd $addname >/dev/null 2>&1
    addresult="정상적으로 추가 되었습니다."
else
    addresult="추가되지 않았습니다."
fi
cat << EOF
----------------------------
$addresult
----------------------------
EOF
read
echo
}

UserList(){
cat << EOF
(사용자 확인)
-------------------------------
$(awk -F: '$3 >= 1001 && $3<=60000{print $1}' /etc/passwd | sort | tee $TMP1 | nl)
-------------------------------
EOF
read
echo
}

UserDel(){
echo "(사용자 삭제)"
echo -n "삭제할 사용자 이름? : "
read delname

userdel -r $delname >/dev/null 2>&1
if [ $? -eq 0 ]; then
    delresult="정상적으로 삭제 되었습니다."
else
    delresult="삭제되지 않았습니다."
fi
cat << EOF
----------------------------
$delresult
----------------------------
EOF
read
echo
}

while true
do
    Menu
    echo -n "선택 번호? : "
    read num
    echo

    case $num in
        '1') UserAdd ;;
        '2') UserList ;;
        '3') UserDel ;;
        '4') break ;;
        '*') echo "목록에 있는 번호를 선택해주세요" ;;
    esac
done