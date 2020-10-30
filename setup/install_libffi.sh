LIBFFIVER=3.3

WRKDIR=$KAGAKUBINRANSETUPDIR/work_libffi
rm -rf ${WRKDIR}
mkdir -p ${WRKDIR}

cd ${WRKDIR}
cp $KAGAKUBINRANARCHIVESDIR/libffi-${LIBFFIVER}.tar.gz .
tar xvfz libffi-${LIBFFIVER}.tar.gz
cd libffi-${LIBFFIVER}
./configure --prefix=$KAGAKUBINRANPKGDIR
make -j`nproc`
make install
cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
