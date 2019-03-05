#!/bin/sh

#Author : Connor Brown
# 19 Feb 2019

NOW=$(date +"%Y%m%d")
LEFTLONG="350"
RIGHTLONG="360"
TOPLAT="-80"
BOTLAT="-90"
FORECAST_CYCLE=$1
FILENAME="./SeniorProject/ARWarn/GFSData/gfs_${NOW}_${FORECAST_CYCLE}.grb"

if [ -z "$1" ]
	then 
		echo "Usage ./GFSDataGet.sh forecast_cycle"
		exit
fi

mkdir -p ./SeniorProject/ARWarn/GFSData

curl -f "https://nomads.ncep.noaa.gov/cgi-bin/filter_gfs_0p25.pl?file=gfs.t${FORECAST_CYCLE}z.pgrb2.0p25.anl&all_lev=on&var_SPFH=on&var_TMAX=on&var_TMIN=on&var_TMP=on&var_UGRD=on&var_VGRD=on&subregion=&leftlon=${LEFTLONG}&rightlon=${RIGHTLONG}&toplat=${TOPLAT}&bottomlat=${BOTLAT}&dir=%2Fgfs.${NOW}${FORECAST_CYCLE}" -o $FILENAME
