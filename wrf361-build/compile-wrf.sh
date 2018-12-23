








export DIR=/home/pj/wrf/libs
export CC=ic
source /home/pj/intel/parallel_studio_xe_2018/compilers_and_libraries_2018/linux/bin/compilervars.sh intel64
 source /home/pj/intel/compilers_and_libraries_2018/linux/mpi/bin64/mpivars.sh


export WRFIO_NCD_LARGE_FILE_SUPPORT=1



export DIR=/home/pj/wrf/libs



export PATH=$DIR/netcdf/bin:$PATH


export NETCDF=$DIR/netcdf



 export JASPERLIB=$DIR/grib2/lib



export JASPERINC=$DIR/grib2/include 


export PATH=$DIR/mpich/bin:$PATH

export J="-j 6"

cd /home/pj/wrf/src/WRFV3/

./clean

./compile em_real > out.txt 2>error.txt
