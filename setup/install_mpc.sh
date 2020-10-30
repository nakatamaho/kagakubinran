VERSION=9.3.0

WRKDIR=/dev/shm/maho/work_gcc
rm -rf $WRKDIR
mkdir -p $WRKDIR
cd $WRKDIR
tar xvf $KAGAKUBINRANARCHIVESDIR/gmp-6.1.0.tar.bz2 ; mv gmp-6.1.0 gmp
tar xvf $KAGAKUBINRANARCHIVESDIR/mpc-1.0.3.tar.gz  ; mv mpc-1.0.3 mpc
tar xvf $KAGAKUBINRANARCHIVESDIR/mpfr-3.1.4.tar.bz2 ; mv mpfr-3.1.4 mpfr 

cd gmp
./configure --prefix=$KAGAKUBINRANPKGDIR
make -j`nproc`
make install

cd ../mpfr
./configure --prefix=$KAGAKUBINRANPKGDIR
make -j`nproc`
make install

cd ../mpc
./configure --prefix=$KAGAKUBINRANPKGDIR
make -j`nproc`
make install

cd 
rm -rf $WRKDIR

