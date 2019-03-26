#!/bin/sh

#Author: Connor BRown
# 21 Feb 2019

DATE=$(date +"%Y%m%d")
DATA_DIR="./SeniorProject/ARWarn/GFSData"
FILENAME="*.grb"
MTIME="+7"
#MMIN="+10"
LOGNAME="$DATA_DIR/log_${DATE}.txt"

mkdir -p $DATA_DIR

find $DATA_DIR -name $FILENAME -type f -mtime $MTIME -delete

#find $DATA_DIR -name $FILENAME -type f -mmin $MMIN >> $LOGNAME

