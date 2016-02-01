#!/bin/bash
. $BLIB/const.sh
. $BLIB/str.sh
. $BLIB/datafile.sh

TGTFILE=.bash_srv
set -x
rm -f $TGTFILE
set +x

echo "# .bashrc" >> $TGTFILE

cat $SRVFILE|while read line
do
    resisempty=`isempty $line`
    if [ "$resisempty" = "true" ]; then
            continue
    fi
    declare -a params=($line)
    parse_server ${params[0]} IP PORT SUSER SPASS
	set -x
    echo "alias ${params[0]}=\"ssh -p ${PORT} ${SUSER}@${IP}\"">> $TGTFILE
	set +x
done

if [ -f $DDIR/bash_srv_other ]; then
    #bash_srv_other store ssh tunnel
	set -x;cat $DDIR/bash_srv_other >> $TGTFILE ; set +x
fi

# if [ "$1" = "-c" ]; then
set -x
rm -f ~/.bash_srv
mv $TGTFILE ~/.bash_srv
set +x
# fi

#rm -f ~/.bash_srv
#ln -sfv $TGTFILE ~/.bash_srv
#set +x

