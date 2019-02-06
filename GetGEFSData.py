#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Nov 23 21:28:32 2018

@author: lejoflores
"""

import bs4 # BeautifulSoup4
import sys 
import os
import urllib.request 
import numpy as np
import shutil
import GetGEFSFile
from joblib import Parallel, delayed



GEFS_URL_base = 'https://nomads.ncep.noaa.gov/pub/data/nccf/com/gens/prod/gefs'
GEFS_Grid     = 'pgrb2'

nEns = 21

WriteDirBase = '.'

fcst_cycle = sys.argv[1]
year       = sys.argv[2]
month      = sys.argv[3]
day        = sys.argv[4]
nProcs     = int(sys.argv[5])

# Error traps
if((fcst_cycle!='00') & (fcst_cycle!='06') & (fcst_cycle!='12') & (fcst_cycle!='18')):
    sys.exit('fcst_cycle must be 00, 06, 12, or 18')

# Construct the name of the url where the GEFS files are
GEFS_URL = GEFS_URL_base+'.'+year+month+day+'/'+fcst_cycle+'/'+GEFS_Grid+'/'

print(GEFS_URL)

# Open the URL
GEFS_HTMP = urllib.request.urlopen(GEFS_URL)

# Store output in a BeautifulSoup class
GEFS_Soup = bs4.BeautifulSoup(GEFS_HTMP,'lxml')

# Get all the links stored in the BeautifulSoup class and store them
GEFS_Links = GEFS_Soup.findAll('a', limit=5)

WriteDir         = WriteDirBase+'/'+'gefs_'+year+month+day
WriteDirFcstCyc  = WriteDir+'/f'+fcst_cycle

print('Directory: ' + WriteDir)

while True:
    try:
        os.mkdir(WriteDir)
        break
    except OSError:
        try:
            shutil.rmtree(WriteDir)
            continue
        except OSError:
            sys.exit('Could not create directory '+WriteDir)
            
os.mkdir(WriteDirFcstCyc)

WriteDirEns = []
for i in np.arange(nEns):
    WriteDirEns.append(WriteDirFcstCyc+'/'+'ens'+f'{i:02}')
    os.mkdir(WriteDirEns[i])

GEFS_Files = []
GEFS_PathID = []
for Link in GEFS_Links:
    FileLink = Link.get_text() # Get the link of the URL
    print("FileLink: " + FileLink)
    if((FileLink.startswith('gep')) | (FileLink.startswith('gec'))):
        GEFS_Files.append(FileLink)
        GEFS_PathID.append(int(FileLink[3:5]))

print('Directory structure created. Proceeding to file download...')

Parallel(n_jobs=nProcs, verbose=60, backend='threading')(delayed(GetGEFSFile.GetSingleGEFSFile)(GEFS_URL,GEFS_Files[i],WriteDirEns[GEFS_PathID[i]]) \
         for i in np.arange(len(GEFS_Files)))
