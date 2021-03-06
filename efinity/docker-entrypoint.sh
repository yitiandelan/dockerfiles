#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
    source /opt/efinity/2020.2/bin/setup.sh
    /opt/efinity/2020.2/bin/efinity "$@"
else
    exec "$@"
fi
