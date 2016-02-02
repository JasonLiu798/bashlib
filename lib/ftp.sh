#!/bin/bash

function ftplist()
{
#$1 HOST
#$2 USER
#$3 PASS
ftp -n<<EOF
open $1
user $2 $3
binary
cd code
prompt
ls
close
bye
EOF
}

function ftpgetput()
{
#$1 HOST
#$2 USER
#$3 PASS
#$4 METHOD
#$5 FILE
ftp -n<<EOF
open $1
user $2 $3
binary
cd code
prompt
$4 $5
close
bye
EOF
}




!<<aaa
#lftp
#!bin/bash
if [ $# -lt 2 ]; then
        echo 'FTP must have two parameter!'
        exit
fi
METHOD=$1
FILE=$2

HOST="10.185.234.139"
USER="ftpuser"
PASS="Xxzx2013@)!#"
#LCD="/d/"
RCD="code"
lftp <<EOF
open ftp://$USER:$PASS@$HOST
$METHOD -o $FILE
EOF

aaa
#echo "`date +%Y-%m-%d %H:%M:%S` FTP $METHOD $FILE"
#echo "`date +%Y-%m-%d %H:%M:%S` FTP END"
