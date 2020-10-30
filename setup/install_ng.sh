unset CC
unset CXX

WRKDIR=$KAGAKUBINRANSETUPDIR/work_ng
rm -rf ${WRKDIR}
mkdir -p ${WRKDIR}

cd ${WRKDIR}
cp $KAGAKUBINRANARCHIVESDIR/ng-1.5beta1-utf8.patch.gz .
cp $KAGAKUBINRANARCHIVESDIR/ng-1.5beta1.tar.gz .
tar xvfz ng-1.5beta1.tar.gz 
cd ng-1.5beta1/
gunzip < ../ng-1.5beta1-utf8.patch.gz | patch -p1 
export CFLAGS="-w -Wno-return-type"
./configure --prefix=$KAGAKUBINRANPKGDIR
make
mkdir -p $KAGAKUBINRANPKGDIR/bin/
make install
/usr/bin/install -c -m 755 ng $KAGAKUBINRANPKGDIR/bin/
cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
