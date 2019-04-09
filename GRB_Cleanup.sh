#!/bin/sh

#Author: Connor BRown
# 21 Feb 2019

DATE=$(date +"%Y%m%d")
DATA_DIR="./GFSData"
IMG_DIR="/opt/python-user/html/images"
FILENAME="*.grb"
NETCDFNAME="*.nc"
IMGNAME="*.png"
MTIME="+30"
#MMIN="+10"
LOGNAME="$DATA_DIR/log_${DATE}.txt"

mkdir -p $DATA_DIR

find $DATA_DIR -name $FILENAME -type f -mtime $MTIME -delete

find $DATA_DIR -name $NETCDFNAME -type f -mtime $MTIME -delete

find $IMG_DIR -name $IMGNAME -type f -mtime $MTIME -delete

#find $DATA_DIR -name $FILENAME -type f -mmin $MMIN >> $LOGNAME

