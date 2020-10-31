#!/bin/bash

source ../kagakubinran_setting.sh

bash -x install_ng.sh          2>&1 | tee log.ng
bash -x install_gcc.sh         2>&1 | tee log.gcc
bash -x install_cmake.sh       2>&1 | tee log.cmake
bash -x install_openblas.sh    2>&1 | tee log.openblas
bash -x install_libffi.sh      2>&1 | tee log.libffi
bash -x install_libopenssl.sh  2>&1 | tee log.libopenssl
bash -x install_python.sh      2>&1 | tee log.python
bash -x install_pythonlibs.sh  2>&1 | tee log.pythonlibs
bash -x install_mpc.sh         2>&1 | tee log.mpc
bash -x install_pyscf.sh       2>&1 | tee log.pyscf
bash -x install_eigen.sh       2>&1 | tee log.eigen
bash -x install_openbabel.sh   2>&1 | tee log.openbabel
bash -x install_jq.sh          2>&1 | tee log.jq
bash -x install_gamess.sh      2>&1 | tee log.gamess
bash -x install_xtb.sh         2>&1 | tee log.xtb
bash -x install_crest.sh       2>&1 | tee log.crest


