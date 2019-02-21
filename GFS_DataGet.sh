#!/bin/sh

#Author : Connor Brown
# 19 Feb 2019

NOW=$(date +"%Y%m%d")
LEFTLONG="0"
RIGHTLONG="360"
TOPLAT="90"
BOTLAT="-90"
FORECAST_CYCLE=$1

wget "https://nomads.ncep.noaa.gov/cgi-bin/filter_gfs_0p25.pl?file=gfs.t${FORECAST_CYCLE}z.pgrb2.0p25.anl&all_lev=on&var_SPFH=on&var_TMAX=on&var_TMIN=on&var_TMP=on&var_UGRD=on&var_VGRD=on&subregion=&leftlon=${LEFTLONG}&rightlon=${RIGHTLONG}&toplat=${TOPLAT}&bottomlat=${BOTLAT}&dir=%2Fgfs.${NOW}${FORECAST_CYCLE}" --output-document="gfs_${NOW}_${FORECAST_CYCLE}.grb"

