#!/bin/bash

curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/HPO/hp.owl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://purl.obolibrary.org/obo/hp.owl
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/GO/go.owl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://purl.obolibrary.org/obo/go/go.owl
