VERSION=9.3.0

WRKDIR=/dev/shm/maho/work_gcc
unset CC
unset CXX
unset FC
unset F77

rm -rf $WRKDIR
mkdir -p $WRKDIR
cd $WRKDIR
tar xvfJ $KAGAKUBINRANARCHIVESDIR/gcc-${VERSION}.tar.xz
cd gcc-${VERSION}
tar xvf $KAGAKUBINRANARCHIVESDIR/gmp-6.1.0.tar.bz2 ; mv gmp-6.1.0 gmp
tar xvf $KAGAKUBINRANARCHIVESDIR/isl-0.18.tar.bz2  ; mv isl-0.18 isl 
tar xvf $KAGAKUBINRANARCHIVESDIR/mpc-1.0.3.tar.gz  ; mv mpc-1.0.3 mpc
tar xvf $KAGAKUBINRANARCHIVESDIR/mpfr-3.1.4.tar.bz2 ; mv mpfr-3.1.4 mpfr 
mkdir build
cd build
../configure --enable-languages=c,c++,fortran --prefix=$KAGAKUBINRANPKGDIR --disable-bootstrap --disable-multilib
make -j`nproc`
make install
cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
