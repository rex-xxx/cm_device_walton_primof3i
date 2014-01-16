#!/bin/sh

BASE=../../../vendor/walton/primof3i/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt`; do
DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
    fi
adb pull /$FILE $BASE/$FILE
done

./setup-makefiles.sh


