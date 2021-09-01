#!/bin/sh

REALSTART=/data/pki/bin/start

if [ -x ${REALSTART} ]; then
    exec ${REALSTART}
else
    echo "no start script found in /data/pki/bin/start"
    echo "gracefully stopping... bye"
    exit 0
fi
