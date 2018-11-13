# wrf-faster
An optimized WRF.exe for the RASP Soaring Weather Forecast

## demo install 
Requires: an existing RASP-docker setup

Clone or download the project{https://github.com/pj68/wrf-faster} into the main RASP-docker folder

unzip the drjack-wrf-faster/wrf361/wrf-V3.6.1.exe.zip into the wrf361 folder

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
COPY wrf361/getvars.ncl $BASEDIR/GM
```
build and run the docker, should see a 10%-20% increase in speed

## notes
the resulting blipmaps are self-similer as the current optimization has reduced numerical precision but the difference should be small

the full set of blipmaps cannot be currently used as the drjack.diff still needs to be applied 

currently this system is configured for single CPU, however the wrf.exe is complied with mpi for a multocore enviroment

