#!/bin/sh
DATA_PKI=/data/pki
BIN_DIR=${DATA_PKI}/bin
if [ ! -e ${BIN_DIR}/easypki ]; then
    # install from gitub
    cd ${DATA_PKI}
    git clone https://github.com/giacinti/easypki.git
    mv easypki/* .
    rmdir easypki
fi


REALSTART=${BIN_DIR}/start

if [ -x ${REALSTART} ]; then
    exec ${REALSTART}
else
    echo "no start script found in ${REALSTART}"
    echo "gracefully stopping... bye"
    exit 0
fi
