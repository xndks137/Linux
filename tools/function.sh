
# Variable Definitions
PKG_TELNET="telnet telnet-server"
PKG_FTP="vsftpd ftp"

CONF_FTP_FTPUSERS=/etc/vsftpd/ftpusers
CONF_FTP_USER_LIST=/etc/vsftpd/user_list
CONF_BASHRC_TEMP=/root/tools/bashrc.template
CONF_BASHRC=$HOME/bashrc.txt


SVC_TELNET="telnet.socket"
SVC_FTP="vsftpd.service"

FW_TELNET="telnet"
FW_FTP="ftp"

# Function Definitions
FWCMD() {
    firewall-cmd --permanent $1
    firewall-cmd --reload
}



function print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}