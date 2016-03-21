#!/bin/bash
source ~/bin/lib.sh

!<<note
generate .bashrc
include
    .bashrc_raw
    .bash_ssh [run gen_bash.sh -p ol/lc]
    .bash_alias
    .bash_path
note

#after bauth,generate .bashrc for server
BASHRC=$TMP/.bashrc
rm -f $BASHRC
cat $SHP/bin/srv/.bashrc >> $BASHRC
cat $SHP/share/bashrc/moba/.bash_alias >> $BASHRC

# gen_bash.sh -p ol -s
cat $SHP/bin/srv/.bash_ssh >> $BASHRC
dos2unix $BASHRC

TMPDIR=$TMP/bin
rm -rf $TMPDIR
mkdir $TMPDIR

set -x
cp $UBIN/*.sh $TMPDIR
#server tool
cp $SHP/share/srv/*.sh $TMPDIR
set +x

for shfile in `ls -A $SHP/share`
do
    filepathname=$SHP/share/$shfile
    if [ -f $filepathname ];then
        set -x
        cp $filepathname $TMPDIR/$shfile
        set +x
    fi
done

rm $TMP/srv.tar.gz
set -x
cd /tmp
dos2unix bin/*
tar zpcvf srv.tar.gz bin .bashrc
rm -rf bin
rm -rf .bashrc
set +x

#scpb -u srv.tar.gz
