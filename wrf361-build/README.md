# WRF 3.6.1 build for RASP

OS: CENTOS 7

## install the intel compiler 
```
  ./install_GUI.sh   
```   
  ** note: at first there was a multilib error 
   Protected multilib versions: libstdc++-4.8.5-16.el7_4.1.i686 != libstdc++-4.8.5-16.el7.x86_64 
   which was resolved by running: 
   ```
   yum update libstdc++ 
   ```
   
   note2: error - 32 bit libraries not found
   ```
   sudo yum install libstdc*i686
   sudo yum install libgcc*i686
   ```

-- edit ~/.bash.rc add
```
source /home/pj/intel/parallel_studio_xe_2018/compilers_and_libraries_2018/linux/bin/compilervars.sh intel64
```
    
 --install the intel mpi lib  
```
 cd l_mpi_2018.1.163   
 ./install_GUI.sh 
```

## install requred libraries
 
 -- install the requred libraries as descibed in:
   http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compilation_tutorial.php
   
  
## build the WRF v3.6.1 source 
  
 ```
 source /opt/intel/bin/ifortvars.sh intel64 
 source /opt/intel/bin/iccvars.sh intel64 
 setenv NETCDF /usr/local/netcdf 
 setenv WRFIO_NCD_LARGE_FILE_SUPPORT 1 
 ```
  
 --run ./configure, choose option 21 
 
   21.  Linux x86_64 i486 i586 i686, Xeon (SNB with AVX mods) ifort compiler with icc  (dm+sm) 
    
 --adjust the configure.wrf, add the compile optimizations:  

```
 OPTAVX          =        -xSKYLAKE-AVX512 
 LDFLAGS_LOCAL   =       -O3 -xsse4.2 -convert big_endian $(OPTAVX) 
  FCOPTIM         =       -O3 $(OPTAVX) -xSSE4.2 -axSSE4.2 -opt-subscription-in-range  -mP2OPT_vec_xform_level=103 -qoverride-limits 
 FCBASEOPTS      =       $(FCBASEOPTS_NO_G) -FR -cm -w -I. $(FCDEBUG) -convert big_endian 
  
  
solve_em.o : solve_em.F 
 
 
solve_em.o : 
	$(RM) $@ 
	$(SED_FTN) $*.F > $*.b  
	$(CPP) -I$(WRF_SRC_ROOT_DIR)/inc $(CPPFLAGS) $*.b  > $*.f90 
	$(RM) $*.b 
	$(FC) -O0 -xO -mP2OPT_vec_xform_level=103 -o $@ -c $(FCFLAGS) $(MODULE_DIRS) $(PROMOTION) $(FCSUFFIX) $(SOLVE_EM_SPECIAL) $(OMP) $*.f90 
```
ref: https://github.com/pj68/wrf-faster/blob/master/wrf361-build/configure.wrf


-- apply the drjack patch

 note: the orig 3.4 patch https://github.com/pj68/wrf-faster/blob/master/wrf361-build/WRFV3.4.drjack.patch
 
 download the updated patch https://github.com/pj68/wrf-faster/blob/master/wrf361-build/WRF3.6.1.drjack.patch
 
```
cd WRFV3
patch -p1 -i WRFV3.6.1.drjack.patch
```

-- if there are errors, reverse the patch 
```
 patch -p1 -R -i WRFV3.6.1.drjack.patch
```

-- clean, use -a as there have been changes to the Registery files
```
./clean -a
```

 -- build wrf 
  download https://github.com/pj68/wrf-faster/blob/master/wrf361-build/compile-wrf.sh , change  DIR to the current work folder
 ```
 ./compile-wrf.sh
  
 -- run wrf using intel's mpirun (adjusted the num_procs from 10 down to 6) 

ulimit -s unlimited 
set OMP_NUM_THREADS=6 
export KMP_STACKSIZE=100000000 
/opt/intel/impi/2018.1.163/bin64/mpirun -n 4 -ppn 2 /home/pj/WRF361/WRFV3/main/wrf.exe 
```
-- ref:

http://www.drjack.info/twiki/bin/view/RASPop/IfortCompile32

http://www.drjack.info/cgi-bin/WEBBBS/rasp-forum_config.pl/read/4884

https://dtcenter.org/wrf-nmm/users/docs/user_guide/V3/users_guide_nmm_chap6.pdf

http://hpclab.ucentral.edu.co/~jmolina/TutorialWRF/WRF%20Software/WRF_Registry_and_Examples.pdf

https://www.climatescience.org.au/sites/default/files/WRF_gill_registry.pdf



