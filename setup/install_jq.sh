
WRKDIR=$KAGAKUBINRANSETUPDIR/work_jq
rm -rf ${WRKDIR}
mkdir -p ${WRKDIR}

cd ${WRKDIR}
tar xvfz $KAGAKUBINRANARCHIVESDIR/jq-1.6.tar.gz
cd ${WRKDIR}/jq-1.6/
cat $KAGAKUBINRANARCHIVESDIR/patch-oniguruma-configure.gz | gunzip | patch -p1
./configure --prefix=$KAGAKUBINRANPKGDIR --with-oniguruma=builtin --disable-maintainer-mode
make
make install
cd $KAGAKUBINRANSETUPDIR
rm -rf ${WRKDIR}
