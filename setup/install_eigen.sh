VERSION=3.3.7

WRKDIR=$KAGAKUBINRANSETUPDIR/work_eigen
rm -rf $WRKDIR
mkdir $WRKDIR

cd $WRKDIR
rm -rf eigen-$VERSION
tar xvfj $KAGAKUBINRANARCHIVESDIR/eigen-$VERSION.tar.bz2
mkdir eigen-$VERSION-build
cd eigen-$VERSION-build
cmake -DCMAKE_INSTALL_PREFIX=$KAGAKUBINRANPKGDIR ../eigen-$VERSION
make install

cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR

