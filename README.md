# ARWarn
ARWarn Senior Project


Sprint Roles:

Jesse Donohue - Project Manager
Connor Brown - Developer

running GetGEFSData.py:

python GetGEFSData.py forecast_cycle threads [dateString]

forecast cycle must be 00, 06, 12, or 18

threads must be a positive integer

dateString must be in the format Year (4 digits) Month (2 digits) Day (2 digits) example: 20190207, defaults to the current date

I limited the amount of downloads to about 5 files for now, this can be changed by altering the limit parameter of the find_all BS4 function
