#!/bin/bash

COMETS_DIR=/deploy/app/restricted/rcode
COMETS_INSTALL_LOG=${1:-"/deploy/logs/update_comets_package.log"}

echo "Ensuring COMETS package is installed..."

# remove lock
rm -rf /usr/lib64/R/library/00LOCK-rcode

R -q -e "devtools::document('$COMETS_DIR', roclets=c('rd', 'collate', 'namespace'))" > $COMETS_INSTALL_LOG  2>&1
R CMD INSTALL $COMETS_DIR --no-html >> $COMETS_INSTALL_LOG  2>&1

sleep 1