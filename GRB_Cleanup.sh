#!/bin/bash

$DATE=$(date +%Y%m%d)
$PATH="./GFSData"
$FILENAME="*.grb"
$MTIME="+1"
$LOGNAME="$PATH/log_${DATE}.txt"

find $PATH -name $FILENAME -type f -mtime $MTIME >> $LOGNAME


