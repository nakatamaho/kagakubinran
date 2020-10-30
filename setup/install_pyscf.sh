VERSION=1.7.4

CINTVERSION=3.1.1
XCVERSION=4.3.4

export LDFLAGS="-L$KAGAKUBINRANPKGDIR/lib -lopenblas"
export PYSCF_INC_DIR=$KAGAKUBINRANPKGDIR/include:$KAGAKUBINRANPKGDIR

WRKDIR=$KAGAKUBINRANSETUPDIR/work_pyscf
rm -rf $WRKDIR
mkdir $WRKDIR
###
cd $WRKDIR
tar xvf $KAGAKUBINRANARCHIVESDIR/libcint-${CINTVERSION}.tar.gz
cd libcint-${CINTVERSION}
mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$KAGAKUBINRANPKGDIR ..
make
make install
###
cd $WRKDIR
tar xvf $KAGAKUBINRANARCHIVESDIR/libxc-${XCVERSION}.tar.gz
cd libxc-${XCVERSION}
mkdir -p build
cd build
cmake -DBUILD_SHARED_LIBS=yes -DCMAKE_INSTALL_PREFIX=$KAGAKUBINRANPKGDIR ..
make
make install
###
cd $WRKDIR
tar xvf $KAGAKUBINRANARCHIVESDIR/pyscf-${VERSION}.tar.gz
cd pyscf-${VERSION}
python3 setup.py build
python3 setup.py install --prefix=$KAGAKUBINRANPKGDIR
rm -rf $WRKDIR
