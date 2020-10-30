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


