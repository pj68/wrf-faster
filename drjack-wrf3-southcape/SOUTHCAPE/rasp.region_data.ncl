#############################################################################################
#############  RASP PLOT INFORMATION - to be read by rasp.ncl  ##############################
#############################################################################################
### FORMAT FOR EACH REGION:
###   1st line: ===MY_REGION_NAME (matching that used in rasp.pl, spaces not allowed)
###   2nd line: units (american/celsius/metric)
###   then (optional) sounding location(s) of 4 lines each: (1) "sounding#" (where # is an integer) (2) sounding id (spaces allowed) (3) latitude (decimal degrees,S=negative) (4) longitude (decimal degrees, W=negative)
###   ( sounding integers normally increase sequentially but need not - numbers must not contain a "+" sign )
### IF RUN REGION IS NOT IN THIS FILE, THEN DEFAULT UNITS USED AND NO SOUNDINGS ARE PLOTTED
#############################################################################################
===EC
celsius
sounding1
L-GOUDA
-33.100
27.778
sounding2
NAHOON
-32.993
27.946
sounding3
VISKOP
-32.8023
28.1374
sounding4
CATHCART
-32.2992
27.1352
sounding5
CATHCART
-32.5853
27.4242
