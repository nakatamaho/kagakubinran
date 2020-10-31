VERSION=6.3.2

WRKDIR=$KAGAKUBINRANSETUPDIR/work_xtb
rm -rf $WRKDIR
mkdir $WRKDIR

cd $WRKDIR
tar xvfz $KAGAKUBINRANARCHIVESDIR/xtb-${VERSION}.tar.gz
cd xtb-$VERSION
mkdir build 
pushd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$KAGAKUBINRANPKGDIR ..
make
ctest
popd
make -C build install
cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
