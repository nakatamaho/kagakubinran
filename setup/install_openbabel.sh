VERSION=3.1.1

WRKDIR=$KAGAKUBINRANSETUPDIR/work_openbabel
rm -rf $WRKDIR
mkdir $WRKDIR

cd $WRKDIR
rm -rf openbabel
rm -rf openbabel-build
mkdir openbabel-build
tar xvfj $KAGAKUBINRANARCHIVESDIR/openbabel-${VERSION}-source.tar.bz2
mv openbabel-${VERSION} openbabel
cd openbabel
cd ../openbabel-build
cmake -DCMAKE_INSTALL_PREFIX=$KAGAKUBINRANPKGDIR/openbabel -DPYTHON_EXECUTABLE=$KAGAKUBINRANPKGDIR/bin/python3 -DRUN_SWIG=ON -DPYTHON_BINDINGS=ON ../openbabel
make
make install

cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
