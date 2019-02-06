# ARWarn
ARWarn Senior Project


Sprint Roles:

Jesse Donohue - Project Manager
Connor Brown - Developer

running GetGEFSData.py:

python GetGEFSData.py <forecast cycle> <year> <month> <date> <threads>

forecast cycle must be 00, 06, 12, or 18
month and date must be two digits, single digit numbers must have a leading 0
I limited the amount of downloads to about 5 files for now, this can be changed by altering the limit parameter of the get_all on line 49