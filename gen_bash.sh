#!/bin/bash
. $UBIN/lib.sh

function usage(){
    echo "usage:
        $ARG0 -p [ol/lc] -r/-s
    ";exit;
}

declare -A TPFILE=(["ssh"]=".bash_ssh" ["redis"]=".bash_redis")
declare -A tpsrv_local=(["ssh"]=$SRVFILE ["redis"]=$REDISFILE)
declare -A tpsrv_ol=(["ssh"]="$SHP/bin/data/srv_ol.dat" ["redis"]=$REDISFILE)
declare -A tpsrv_olxy=(["ssh"]="$SHP/bin/data/srv_ol_xy.dat" ["redis"]=$REDISFILE)
#default use tpsrv_local
declare -A profile_arr=(["ol"]="tpsrv_ol" ["lc"]="tpsrv_local" ["olxy"]="tpsrv_olxy")

while getopts srp: opts
do
    case $opts in
    s) MK=ssh ;;
    r) MK=redis ;;
    p) profile=$OPTARG
    ;;
    esac
done

if [ "$MK" = "" ];then
    usage; exit;
fi
if [ "$profile" = "" ];then
    profile="lc"
fi
filearrname=${profile_arr[$profile]}
tgtfilename=${TPFILE[$MK]}
tmptgtfile=$TMP/$tgtfilename
# echo 'file name '$filearrname
eval datafilename=\${$filearrname["$MK"]}

if [ "$tgtfilename" = "" ];then
    usage; exit;
fi

echo "tgt file "$tmptgtfile",datafile "$datafilename

set -x
rm -f $tmptgtfile
set +x

echo "# .bashrc" >> $tmptgtfile

cat $datafilename|while read line
do
    echo $line
    resisempty=`isempty $line`
    if [ "$resisempty" = "true" ]; then
            continue;
    fi
    declare -a params=($line)
    if [ "$MK" = "ssh" ];then
        parse_server $datafilename ${params[0]} IP PORT SUSER SPASS
        set -x
        echo "alias ${params[0]}=\"ssh -p ${PORT} ${SUSER}@${IP}\"">> $tmptgtfile
        set +x

    elif [ "$MK" = "redis" ];then
        parse_redis $datafilename ${params[0]} IP PORT
        set -x
        echo "alias r${params[0]}=\"redis-cli -p ${PORT} -h ${IP}\"">> $tmptgtfile
        set +x
    fi
done

if [ "$MK" = "ssh" ];then
    if [ -f $DDIR/bash_srv_other ]; then
        #bash_srv_other store ssh tunnel
        cat $DDIR/bash_srv_other >> $tmptgtfile ;
    fi
fi

if [ "$profile" = "lc" ];then
    set -x
    rm -f ~/$tgtfilename
    mv $tmptgtfile ~/$tgtfilename
    set +x
elif [ "$profile" = "ol" ];then
    set -x
    rm -f $SHP/bin/srv/$tgtfilename
    mv $tmptgtfile $SHP/bin/srv/$tgtfilename
    set +x
fi




