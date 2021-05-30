#!/bin/bash
#function returns
SUCCESS=0
FAIL=1

#script name
ARG0=`basename $0`

#timestamp
function ts()
{
echo date '+%s'
}
TS=`ts`

#default path
UBIN=~/bin
DDIR=$UBIN/data
BLIB=$UBIN/lib
SRVFILE=$DDIR/srv_local.dat
DBFILE=$DDIR/db.dat
REDISFILE=$DDIR/redis_server.dat
DPFILE=$DDIR/deploy.dat
#default upload path
DFTUPATH=/data
#potocol
HTTP="http://"
FTP="ftp://"
HTTPS="https://"
SSH="ssh://"
#upload download
DOWN=download
UP=upload

YES="yes"
NO="no"
TRUE="true"
FLASE="false"
T="true"
F="false"
#profile
DEV="dev"
PDEV="-Pdev"
#format
SEPLINE="--------------------------------"

#error code
#file not exist
E_FILE_NE=201


#!/bin/bash

function showfile()
{
local FILE=$1
local GREP_TXT=$2
local PARAM=$3
#echo "$FILE"
cat $FILE|grep -C $PARAM $GREP_TXT
}

function exchange_file()
{
local RAW=$1
local BAK_FILE=${RAW}.bak
local TMP_FILE=${RAW}.tmp
set -x
mv $RAW $TMP_FILE
mv $BAK_FILE $RAW
mv $TMP_FILE $BAK_FILE
set +x
}

function is_infile()
{
# $1 filename $2 sstr
local filename=$1
local sstr=$2
if [ "$filename" = "" ]; then
	return $E_FILE_NE
fi
local res=$SUCCESS
CHK=`cat $filename |awk '{if($1~/^'"${sstr}"'$/)print $1}'|wc -l`
#echo "chk $CHK"
if [ "$CHK" != "1" ]; then #not exist
        #echo "$0 ,no server match $SRV ,add $SRV to $SRVFILE "
	res=$FAIL
fi
return $res
}

function getline()
{
#$1 filename $2 sstr
local filename=$1
local sstr=$2
is_infile $filename $sstr
local infile_res=$?
#echo "in file $infile_res"
if [ "$infile_res" != "0" ]; then
	exit $FAIL
fi
local line=`cat $filename|grep $2`
#set -x
echo $line
}

function parse_server()
{
#$1=filename $2 profile $3=ip $4=port $5=user $6 password
#dp113 192.168.143.113 22 work work
#0     1               2  3    4
local arr=(`getline $1 $2`)
if [ "${arr[0]}" = "$FAIL" ]; then
	return $FAIL
fi
#echo "srvinfo $SRVINFO"
eval $3='${arr[1]}'
eval $4='${arr[2]}'
eval $5='${arr[3]}'
eval $6='${arr[4]}'
return 0
}

#set -x
!<<aa
parse_server /d/yp/project/shell/bin/data/srv_ol.dat 9 IP PORT SUSER SPASS
echo $?
echo "ip $IP,port $PORT,user $SUSER,pass $SPASS"
aa

#parse dev PROFILE SRVMARK
function parse_deploy()
{
#dev -Pdev dm118
#0   1     2
local DPINFO=(`getline $DPFILE $1`)
echo "deploy info $DPINFO"
eval $2="${DPINFO[1]}"
eval $3="${DPINFO[2]}"
}

function parse_redis()
{
#$1 file $2=profile  $3=IP     $4=PORT
#dev 192.168.143.112 6379
#0   1		     2
#echo "file $REDISFILE $1"
local arr=(`getline $1 $2`)
#set -x
#echo "redis info ${arr[@]}"
if [ "${arr[0]}" = "$FAIL" ]; then
	return $FAIL
fi
eval $3="${arr[1]}"
eval $4="${arr[2]}"
return 0
}

#set -x
:<< aaa
parse_redis dev IP PORT
echo "res $?"
echo "IP port $IP $PORT"
aaa

#$PR_RES=$?
#if [ "$PR_RES" = "$FAIL" ]; then
#	echo "fail"

#REDIS_INFO=`getline $REDISFILE dev`
#echo $REDIS_INFO
#is_infile $DPFILE devd
#echo $?
#RES=`getline /d/yp/project/member/db.dat devsd`
#!/bin/bash
#
function date2timestamp()
{

}
#date -d "2010-10-18 00:00:00" +%s
#!/bin/bash

#directory exist
function isdir()
{
    #$1 dirpath
    if [ ! -d "$1" ]; then
        return 1
    else
        return 0
    fi
}

!<<aaa
isdir /home/mobaxterm/bin/li
if [ "$?" = "0" ]; then
    echo 'dir exist'
else
    echo 'not exist'
fi
aaa

#-x 文件存在，且可执行
function isfile()
{
    if [ ! -d "$1" ]; then
        return 0
    else
        return 1
    fi
}

!<<aaa
isfile "/home/mobaxterm/bin/lib/file.sh"
if [ "$?" = "0" ]; then
    echo 'file exist'
else
    echo 'not exist'
fi
aaa

!<<aaa
-a file exists.
-b file exists and is a block special file.
-c file exists and is a character special file.
-d file exists and is a directory.
-e file exists (just the same as -a).
-f file exists and is a regular file.
-g file exists and has its setgid(2) bit set.
-G file exists and has the same group ID as this process.
-k file exists and has its sticky bit set.
-L file exists and is a symbolic link.
-n string length is not zero.
-o Named option is set on.
-O file exists and is owned by the user ID of this process.
-p file exists and is a first in, first out (FIFO) special file or
named pipe.
-r file exists and is readable by the current process.
-s file exists and has a size greater than zero.
-S file exists and is a socket.
-t file descriptor number fildes is open and associated with a
terminal device.
-u file exists and has its setuid(2) bit set.
-w file exists and is writable by the current process.
-x file exists and is executable by the current process.
aaa


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




!<<lftpexample
METHOD=$1
FILE=$2
HOST=""
USER=""
PASS=""
#LCD="/d/"
RCD="code"
lftp <<EOF
open ftp://$USER:$PASS@$HOST
$METHOD -o $FILE
lftpexample

#echo "`date +%Y-%m-%d %H:%M:%S` FTP $METHOD $FILE"
#echo "`date +%Y-%m-%d %H:%M:%S` FTP END"
#!/bin/bash

#ip to location
function ip2locate()
{
#$1=ip
res=`wget -q -O- http://ip.ws.126.net/ipquery?ip="$1" | iconv -f gbk -t utf-8 `
}

#|native2ascii -reverse|iconv -f gbk -t utf-8`
!<<aaa
#taobao
#http://ip.taobao.com/service/getIpInfo.php?ip=
#{"code":0,"data":{"country":"\u4e2d\u56fd","country_id":"CN","area":"\u534e\u4e2d","area_id":"400000","region":"\u6cb3\u5357\u7701","region_id":"410000","city":"\u90d1\u5dde\u5e02","city_id":"410100","county":"","county_id":"-1","isp":"\u7535\u4fe1","isp_id":"10

#sina
#http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=123.160.165.114
#var remote_ip_info = {"ret":1,"start":-1,"end":-1,"country":"\u4e2d\u56fd","province":"\u6cb3\u5357","city":"\u90d1\u5dde","district":"","isp":"","type":"","desc":""};

#126
#http://ip.ws.126.net/ipquery?ip=123.160.165.114
#var lo="河南省", lc="郑州市"; var localAddress={city:"郑州市", province:"河南省"}

echo $res
}
aaa

#echo `ip2locate $1`
#echo $a
#!/bin/bash

function random_num()
{
local min=$1
if [ "$min" = "" ];then
	min=0
fi
local max=$2
if [ "$max" = "" ];then
	max=100
else
	max=$(($2-$min+1))
fi
#echo "min $min max $max"
#set -x
local num=$(cat /dev/urandom | head -n 10 | cksum | awk -F ' ' '{print $1}')
#echo $num
echo $(($num%$max+$min))
}

function random_ip()
{
local IP
local a
for a in `seq 4`
do
    IP[$((a-1))]=`random_num 0 254`
done
local WIP=${IP[0]}.${IP[1]}.${IP[2]}.${IP[3]}
echo ${WIP}
}

#echo `random_num 0 254`
function random_num1()
{
local min=$1
if [ "$min" = "" ];then
        min=0
fi
local max=$2
if [ "$max" = "" ];then
        max=100
else
        max=$(($2-$min+1))
fi
local num=$(($RANDOM+1000000000)) #增加一个10位的数再求余
echo $(($num%$max+$min))
}

function random_md5()
{
local LEN
if [ "$1" = "" ];then
	LEN=32
else
	LEN=$1
fi
set -x
echo date +%s%N | md5sum | head -c $LEN
}

#echo `random `
#echo `random_num 1 10`
#echo `random_num1 1 10`
#!/bin/bash
#. $BLIB/const.sh

CMDFILE=$DDIR/rediscmd.dat
#echo $CMDFILE
function enter(){
        echo "" >> $CMDFILE
}

#!/bin/bash
function trim()
{
        res=`echo $1 | sed -e "s/^[ \s]\{1,\}//g" | sed -e "s/[ \s]\{1,\}$//g"`
        echo $res
}

function contain()
{
local res=$(echo $1 | grep "$2")
echo $res
}

function isempty()
{
local res=false
local str=`trim $1`
if [ "$str" =  "" ]; then
        res=true
fi
if echo $str|grep -qe '^#' ;then
        res=true
fi
echo $res
}

function strlen()
{
    echo `expr length $1`
}


function strtrim()
{
    echo `echo "$1"`
}

#获取字符串子串
#输入：字符串 截取起始位置
#输入：字符串 截取起始位置 截取长度
function substring()
{
    if [ $# -eq 2 ]; then
        len=`strlen $1`
        echo `expr substr $1 $2 $len`
    elif [ $# -eq 3 ]; then
        echo `expr substr $1 $2 $3`
    else
        echo
    fi
}


#将字符串中字符全部转换为大写
#输入：字符串
function str_toupper()
{
    echo $(echo $1 | tr '[a-z]' '[A-Z]')
}

#将字符串中字符全部转换为小写
#输入：字符串
function str_tolower()
{
    echo $(echo $1 | tr '[A-Z]' '[a-z]')
}


#delete slash in filename
#input:  xxx/yyy
#output: yyy
function del_slash_in_filename()
{
local upfilepath=$1
i=1

while((1==1))
do
        split=`echo $upfilepath|cut -d "/" -f$i`
        if [ "$split" != "" ]; then
                ((i++))
        else
                ((i--))
                split=`echo $upfilepath|cut -d "/" -f$i`
                local RES=$split
                break
        fi
done
echo $RES
}

#get file name behind the path
#input: /aaa/bbb/ccc   	xxx	sdd/ddd
#output: ccc		xxx	ddd
function get_filename(){
local res=''
local raw=$1
raw=${raw#"/"}
#echo "raw $raw \r\n"

if [[ "$raw" =~ "/" ]]; then
        res=`del_slash_in_filename $raw`
else
        res=$raw
fi
echo $res
}


function removelast(){
    filter ~
    bidx=`expr index $rcfile "~"`
    if [ $bidx -gt 0 ];then
        rcfile=`expr substr "$rcfile" 1 $((bidx-1))`
    fi
}
#TEST
#a=`del_slash_in_filename "dsfsdf/sdfds"`
#echo "a:" $a
#b=`get_filename "fdf/sdfjkldjks"`
#echo "res " $b
