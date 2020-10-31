#!/bin/bash

GAMESSVERSION=20190930.R2
WRKDIR=$KAGAKUBINRANSETUPDIR/work_gamess
rm -rf $WRKDIR
mkdir $WRKDIR
cd $WRKDIR

WRKDIR=$KAGAKUBINRANSETUPDIR/work_gamess
NAME=GAMESS-${GAMESSVERSION}
###########
OPENMP=true
NUMOFJOBS=4
FORTRAN=gfortran
GFORTRANVERSION=9.1 #currently up to 9.1 is supported
###########
cd $WRKDIR
tar xvfz $KAGAKUBINRANARCHIVESDIR/$GAMESSVERSION/gamess-current.tar.gz
mv gamess gamess_orig
tar xvfz $KAGAKUBINRANARCHIVESDIR/$GAMESSVERSION/gamess-current.tar.gz
cd gamess
###########
patch -p1 < $KAGAKUBINRANARCHIVESDIR/$GAMESSVERSION/patch-gamess.${GAMESSVERSION}
cp $KAGAKUBINRANARCHIVESDIR/$GAMESSVERSION/install.info_linux64 install.info

#######################################
sed -i "s|%%GAMESS_BUILD_DIR%%|$WRKDIR|g"         install.info
sed -i "s|%%OPENMP%%|$OPENMP|g"                   install.info
sed -i "s|%%FORTRAN%%|$FORTRAN|g"                 install.info
sed -i "s|%%GFORTRANVERSION%%|$GFORTRANVERSION|g" install.info
sed -i "s|%%GFORTRANVERSION%%|$GFORTRANVERSION|g" install.info
sed -i "s|%%KAGAKUBINRANPKGDIR%%|$KAGAKUBINRANPKGDIR|g" install.info
sed -i "s|%%FORTRAN%%|$FORTRAN|g"                 comp
sed -i "s|%%FORTRAN%%|$FORTRAN|g"                 lked
sed -i "s|%%NUMOFJOBS%%|$NUMOFJOBS|g"             compall
#######################################

cd tools
cp actvte.code actvte.f
sed -e "s/^\*UNX/    /" actvte.code > actvte.f
$FORTRAN -o actvte.x actvte.f
cd ..

csh -x ./compall 

cd ddi ; ./compddi ; cp ddikick.x ..; cd ..
csh ./lked gamess 00

export KAGAKUBINRANPKGDIR=$KAGAKUBINRANTOPDIR/pkg/$KAGAKUBINRANARCH
rm -rf $KAGAKUBINRANPKGDIR/gamess
rm -f $KAGAKUBINRANPKGDIR/bin/rungms
mkdir -p $KAGAKUBINRANPKGDIR/gamess
mkdir -p $KAGAKUBINRANPKGDIR/bin
sed -i "s|set GMSPATH.*|set GMSPATH=$KAGAKUBINRANPKGDIR/gamess|g" rungms
cp rungms $KAGAKUBINRANPKGDIR/bin/rungms
cp ddikick.x $KAGAKUBINRANPKGDIR/gamess
cp gamess.00.x $KAGAKUBINRANPKGDIR/gamess
cp gms-files.csh $KAGAKUBINRANPKGDIR/gamess
cp -r auxdata $KAGAKUBINRANPKGDIR/gamess

cd $WRKDIR
cd ..
rm -rf $WRKDIR
#pushd $KAGAKUBINRANPKGDIR
#tar cvfJ $KAGAKUBINRANSETUPDIR/gamess_${GAMESSVERSION}_${KAGAKUBINRANPKG_SUFFIX}.tar.xz gamess bin/rungms
#popd
