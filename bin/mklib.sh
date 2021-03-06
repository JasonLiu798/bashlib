#!/bin/bash
# cat all lib file into one file lib.sh
# then only import one file,example:
#   source ~/bin/lib.sh


TGTFILE=~/bin/lib.sh

if [ $# -lt 1 ]; then
    set -x
    rm -f $TGTFILE
    cat $BLIB/* >> $TGTFILE
    set +x
    exit;
fi

!<<aaa
# TGTFILE=/d/lib.sh
rm -f $TGTFILE
while getopts sd opts
do
    case $opts in
    s) STR="Y"   ;;
    d) DF="Y" ;;
    esac
done

set -x
cat $BLIB/const.sh >> $TGTFILE
set +x
if [ "$STR" == "Y" ];then
    set -x
    cat $BLIB/str.sh >> $TGTFILE
    set +x
fi
if [ "$DF" == "Y" ];then
    set -x
    cat $BLIB/datafile.sh >> $TGTFILE
    set +x
fi
aaa

