#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
    /usr/bin/python2 /opt/hdlregs/hdlregs.py "$@"
else
    exec "$@"
fi

