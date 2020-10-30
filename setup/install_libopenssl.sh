OPENSSLVER=1.1.1c

WRKDIR=$KAGAKUBINRANSETUPDIR/work_OPENSSL
rm -rf ${WRKDIR}
mkdir -p ${WRKDIR}

cd ${WRKDIR}
cp $KAGAKUBINRANARCHIVESDIR/openssl-${OPENSSLVER}.tar.gz .
tar xvfz openssl-${OPENSSLVER}.tar.gz
cd openssl-${OPENSSLVER}
./config --prefix=$KAGAKUBINRANPKGDIR
make
make install
cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
