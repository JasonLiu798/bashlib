#!/bin/bash

# gen moba  ./bashrc.sh moba

!<<note
generate .bashrc
include
    .bashrc_raw
    .bash_ssh [run gen_bash.sh -p ol/lc]
    .bash_alias
    .bash_path
note

SRV=$1

if [ "$SRV" = "" ];then
    echo "server is null"
    exit;
else
    echo "use $SRV"
fi

#after bauth,generate .bashrc for server
BASHRC=.bashrc
rm -f $BASHRC
cat ./bashrc/$SRV/bashrc.sh >> $BASHRC
cat ./bashrc/$SRV/bash_alias.sh >> $BASHRC
cat ./bashrc/$SRV/bashpath.sh >> $BASHRC

dos2unix $BASHRC


cat $BASHRC > ~/.bashrc
cat $BASHRC


