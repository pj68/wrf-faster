# wrf-faster
A multicore Skylake optimized WRF.exe for the RASP Soaring Weather Forecast 

# Build
The changelog for this build : https://github.com/pj68/wrf-faster/blob/master/wrf361-build/README.md

## Demo install 
Requires: an existing RASP-docker setup, ref: https://github.com/wargoth/rasp-docker-script

Clone or download the project{https://github.com/pj68/wrf-faster} into the main RASP-docker folder

Unzip the drjack-wrf-faster/wrf361/wrf-V3.6.1.exe-xSKYLAKE-AVX512.zip into the wrf361 folder

Add the geog.tar.gz file ito the drjack-wrf-faster folder

Build & run the docker container as described in drjack-wrf-southcape/README.md


## Updating an existing region

Copy the wrf361 folder into the region's folder

Edit the Dockerfile, add the additional file copy code:
```
COPY wrf361/GM-master.pl $BASEDIR/bin
COPY wrf361/wrf-V3.6.1.exe $BASEDIR/bin
COPY wrf361/rasp.site.runenvironment $BASEDIR
COPY wrf361/libs $BASEDIR/libs
```
Build and run the docker container, should see a 10% increase in speed on a single Skylake cpu system and another 40% increase on a dual core system

## File change descriptions
wrf361/GM-master.pl - the mpi build of wrf.exe has a different output filename so changed the wrf.exe output log filename, line 2066

rasp.site.runenvironment - appended the new libs folder to the LD_LIBRARY_PATH

## Notes

Currently the GM-master.pl script is configured for single CPU, however the wrf.exe is complied with mpi for a multicore enviroment

