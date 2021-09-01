#!/bin/sh
DATA_PKI=/data/pki
BIN_DIR=${DATA_PKI}/bin
GIT_REPO=https://github.com/giacinti/easypki.git
[ ! -e ${BIN_DIR}/easypki ] && git -C ${DATA_PKI} clone ${GIT_REPO} ${DATA_PKI}

REALSTART=${BIN_DIR}/start

if [ -x ${REALSTART} ]; then
    exec ${REALSTART}
else
    echo "no start script found in ${REALSTART}"
    echo "gracefully stopping... bye"
    exit 0
fi
