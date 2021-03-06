#!/bin/bash
vdir=/usr/local/virtuoso-opensource

cd ${vdir}/var/lib/virtuoso
chown -R `whoami` db

cd ${vdir}/var/lib/virtuoso/db
${vdir}/bin/virtuoso-t

source /opt/Ontologies/scripts/download.sh
source /opt/Ontologies/scripts/convert.sh

${vdir}/bin/isql \
    localhost \
    dba dba \
    errors=stdout \
    /opt/Ontologies/scripts/import.sql

tail -F ${vdir}/var/lib/virtuoso/db/virtuoso.log
