# wrf-faster
An optimized WRF.exe for the RASP Soaring Weather Forecast

## demo install 
Requires: an existing RASP-docker setup

Clone or download the project{https://github.com/pj68/wrf-faster} into the main RASP-docker folder

unzip the drjack-wrf-faster/wrf361/wrf-V3.6.1.exe-xSKYLAKE-AVX512.zip into the wrf361 folder

add the geog.tar.gz file ito the drjack-wrf-faster folder

build & run the docker container as described in drjack-wrf-faster/README.md


## updating an existing region

copy the wrf361 folder into the region's folder

edit the Dockerfile, add the additional file copy code:
```
COPY wrf361/GM-master.pl $BASEDIR/bin
COPY wrf361/wrf-V3.6.1.exe $BASEDIR/bin
COPY wrf361/rasp.site.runenvironment $BASEDIR
COPY wrf361/libs $BASEDIR/libs
```
build and run the docker container, should see a 10%-20% increase in speed

## file change descriptions
wrf361/GM-master.pl -the mpi build of wrf.exe has a different output filename so changed the wrf.exe output log filename, line 2066

rasp.site.runenvironment - appended the new libs folder to the LD_LIBRARY_PATH

## notes

currently the GM-master.pl script is configured for single CPU, however the wrf.exe is complied with mpi for a multocore enviroment

