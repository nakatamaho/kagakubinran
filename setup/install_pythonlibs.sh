WRKDIR=$KAGAKUBINRANSETUPDIR/work_pythonlibs

CYTHONVERSION=0.29.21
rm -rf $WRKDIR
mkdir $WRKDIR
cd $WRKDIR
tar xvfz $KAGAKUBINRANARCHIVESDIR/cython-${CYTHONVERSION}.tar.gz
cd cython-${CYTHONVERSION}/
python3 setup.py install --prefix=$KAGAKUBINRANPKGDIR

NUMPYVERSION=1.19.1
cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
mkdir $WRKDIR
cd $WRKDIR
tar xvfz $KAGAKUBINRANARCHIVESDIR/numpy-${NUMPYVERSION}.tar.gz
cd numpy-${NUMPYVERSION}/
export BLAS=$KAGAKUBINRANPKGDIR/lib/libopenblas.so
export LAPACK=$KAGAKUBINRANPKGDIR/lib/libopenblas.so
NPY_LAPACK_ORDER=openblas NPY_BLAS_ORDER=openblas python3 setup.py install --prefix=$KAGAKUBINRANPKGDIR

PYBIND11VERSION=2.6.0
cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
mkdir $WRKDIR
cd $WRKDIR
tar xvfz $KAGAKUBINRANARCHIVESDIR/pybind11-${PYBIND11VERSION}.tar.gz
cd pybind11-${PYBIND11VERSION}/
python3 setup.py install --prefix=$KAGAKUBINRANPKGDIR

#ERROR: pyscf 1.7.4 has requirement scipy<1.5, but you'll have scipy 1.5.2 which is incompatible.

SCIPYVERSION=1.4.1
cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR
mkdir $WRKDIR
cd $WRKDIR
tar xvf $KAGAKUBINRANARCHIVESDIR/scipy-${SCIPYVERSION}.tar.gz
cd scipy-${SCIPYVERSION}/
NPY_LAPACK_ORDER=openblas NPY_BLAS_ORDER=openblas python3 setup.py install --prefix=$KAGAKUBINRANPKGDIR

cd $KAGAKUBINRANSETUPDIR
rm -rf $WRKDIR

