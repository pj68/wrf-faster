FROM yavalek/drjack-wrf3:latest

ENV BASEDIR=/root/rasp/

WORKDIR /root/

ADD geog.tar.gz $BASEDIR

RUN cp -a $BASEDIR/region.TEMPLATE $BASEDIR/SOUTHCAPE

COPY SOUTHCAPE/wrfsi.nl SOUTHCAPE/rasp.run.parameters.SOUTHCAPE $BASEDIR/SOUTHCAPE/
COPY SOUTHCAPE/rasp.region_data.ncl $BASEDIR/GM/
COPY SOUTHCAPE/rasp.site.runenvironment $BASEDIR/
COPY SOUTHCAPE/rasp.site_load.wind.ncl $BASEDIR/GM/
COPY wrf361/GM-master.pl $BASEDIR/bin
COPY wrf361/wrf-V3.6.1.exe $BASEDIR/bin
COPY wrf361/rasp.site.runenvironment $BASEDIR
COPY wrf361/libs $BASEDIR/libs
COPY wrf361/getvars.ncl $BASEDIR/GM

ENV PATH="${BASEDIR}/bin:${PATH}"
ENV START_HOUR=24 

# initialize
RUN cd $BASEDIR/SOUTHCAPE/ \
  && wrfsi2wps.pl \
  && wps2input.pl \
  && geogrid.exe

# cleanup
RUN rm -rf $BASEDIR/geog

WORKDIR /root/rasp/

VOLUME ["/root/rasp/SOUTHCAPE/OUT/", "/root/rasp/SOUTHCAPE/LOG/"]

CMD ["runGM", "SOUTHCAPE"]
