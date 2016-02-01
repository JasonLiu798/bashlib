#!/bin/bash
# cat all lib file into one file lib.sh
# then only import one file,example:
#   source ~/bin/lib.sh
TGTFILE=$UBIN/lib.sh
set -x
rm -f $TGTFILE
cat $BLIB/* >> $TGTFILE
set +x
