VERSION=3.8.5

WRKDIR=$KAGAKUBINRANSETUPDIR/work_python
rm -rf $WRKDIR
mkdir $WRKDIR

cd $WRKDIR
tar xvfJ $KAGAKUBINRANARCHIVESDIR/Python-$VERSION.tar.xz
cd Python-$VERSION
./configure --prefix=$KAGAKUBINRANPKGDIR --with-ensurepip --enable-shared --enable-loadable-sqlite-extensions
make -j`nproc`
make test
make install
cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
