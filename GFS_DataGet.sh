#!/bin/sh

#Author : Connor Brown
# 19 Feb 2019

NOW=$(date +"%Y%m%d")
LEFTLONG="0"
RIGHTLONG="360"
TOPLAT="90"
BOTLAT="-90"
FORECAST_CYCLE=$1
FILENAME="./GFSData/gfs_${NOW}_${FORECAST_CYCLE}.grb"
FILENCNAME="./GFSData/gfs_${NOW}_${FORECAST_CYCLE}.nc"
PLOTSCRIPT="/opt/python-user/cs_student_project/plotar.py"
PLOTOUTPUTFILE="/opt/python-user/html/images/${NOW}${FORECAST_CYCLE}.png"

if [ -z "$1" ]
	then 
		echo "Usage ./GFSDataGet.sh forecast_cycle"
		exit
fi

mkdir -p ./GFSData
mkdir -p opt/python-user/html/images

curl -f "https://nomads.ncep.noaa.gov/cgi-bin/filter_gfs_0p25.pl?file=gfs.t${FORECAST_CYCLE}z.pgrb2.0p25.anl&all_lev=on&var_SPFH=on&var_TMAX=on&var_TMIN=on&var_TMP=on&var_UGRD=on&var_VGRD=on&subregion=&leftlon=${LEFTLONG}&rightlon=${RIGHTLONG}&toplat=${TOPLAT}&bottomlat=${BOTLAT}&dir=%2Fgfs.${NOW}${FORECAST_CYCLE}" -o $FILENAME

echo "Saving to $FILENAME"

ncl_convert2nc $FILENAME -o ./GFSData

$PLOTSCRIPT $FILENCNAME $PLOTOUTPUTFILE
