VERSION=2.10.2

tar xvfz $KAGAKUBINRANARCHIVESDIR/crest.tgz -C $KAGAKUBINRANPKGDIR/bin
tar xvfz $KAGAKUBINRANARCHIVESDIR/crest-${VERSION}.tar.gz -C $KAGAKUBINRANPKGDIR/share

exit

WRKDIR=$KAGAKUBINRANSETUPDIR/work_crest
rm -rf $WRKDIR
mkdir $WRKDIR

cd $WRKDIR
tar xvfz $KAGAKUBINRANARCHIVESDIR/crest-${VERSION}.tar.gz
cd crest-$VERSION
#mkdir build 
#pushd build
#cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$KAGAKUBINRANPKGDIR ..
#make
#ctest
#popd
#make -C build install
#cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
