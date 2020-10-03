#!/bin/bash

make distclean
rm -rf test-install


source /mnt/wyf/env.sh
spack load gcc@9.3.0
spack load openmpi@3.1.6

make distclean
rm -rf test-install

./bootstrap 
./configure --prefix=`pwd`/test-install
make
make check
make install


mpirun -n 2 ./test-install/bin/mdtest -I 1000 -L -u -F -P -d ./test-bench


make distclean
rm -rf test-install