#!/bin/bash

. $UBIN/lib.sh
#. $LIB/datafile.sh
#mysql -h localhost -u root -p123456 < F:\hello world\niuzi.sql
function usage()
{
echo "$ARG0 usage:
	$ARG0 -s [sql]
	$ARG0 -p [prof] -s [sql]"
}

PROF=dev #default db use dev	

while getopts p:s: opts
do
	case $opts in
	p) 
	if [ "$OPTARG" != "" ];then
		PROF=$OPTARG
	fi
	;;
	s)
	if [ "$OPTARG" = "" ];then
		echo "sql is null"
		exit;
	fi
	SQL=$OPTARG
	;;
	esac
done

echo "prof $PROF ,sql $SQL"

DBINFO=`cat $DBFILE |grep $PROF`
if [ "$DBINFO" = "" ];then
	echo "no server match profile $PROF"; usage; exit;
fi
DBINFOARR=($DBINFO)
#0    1             2    3          4      5
#mark ip            port db         user   password
IP=${DBINFOARR[1]}
PORT=${DBINFOARR[2]}
DBNAME=${DBINFOARR[3]}
DBUSER=${DBINFOARR[4]}
DBPASS=${DBINFOARR[5]}

set -x
mysql -P $PORT -h $IP -u $DBUSER -p$DBPASS -D $DBNAME -e "$SQL"




