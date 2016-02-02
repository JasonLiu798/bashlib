#!/bin/bash

source ~/bin/lib.sh


#after bauth,generate .bashrc for server
BASHRC=$TMP/.bashrc
rm -f $BASHRC
cat $SHP/bin/srv/.bashrc >> $BASHRC
cat $SHP/share/bashrc/moba/.bash_alias >> $BASHRC

#gen_bash.sh -p ol -s
cat $SHP/bin/srv/.bash_ssh >> $BASHRC

TMPDIR=$TMP/bin
rm -rf $TMPDIR
mkdir $TMPDIR

set -x
cp $UBIN/*.sh $TMPDIR
cp $SHP/share/srv/*.sh $TMPDIR
set +x

for file in `ls -A $SHP/share`
do
    if [ -f $file ];then
        set -x
        cp $SHP/share/$file $TMPDIR
        set +x
    fi
done

rm $TMP/srv.tar.gz
set -x
tar zpcvf $TMP/srv.tar.gz $BASHRC $TMPDIR
set +x
