#!/bin/bash

curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/HPO/hp.owl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://purl.obolibrary.org/obo/hp.owl
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/GO/go.owl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://purl.obolibrary.org/obo/go/go.owl

ruby \
    /opt/Ontologies/scripts/hpa2rdf/hpa2rdf.rb \
    /opt/Ontologies/Annotations/phenotype_annotation.tab \
    > /opt/Ontologies/Annotations/phenotype_annotation.ttl \
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/Annotations/phenotype_annotation.ttl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://localhost/phenotype_annotation.ttl

ruby \
    /opt/Ontologies/scripts/hpa2rdf/hpa2rdf.rb \
    /opt/Ontologies/Annotations/phenotype_annotation_hpoteam.tab \
    > /opt/Ontologies/Annotations/phenotype_annotation_hpoteam.ttl \
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/Annotations/phenotype_annotation_hpoteam.ttl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://localhost/phenotype_annotation_hpoteam.ttl

ruby \
    /opt/Ontologies/scripts/hpa2rdf/hpa2rdf.rb \
    /opt/Ontologies/Annotations/negative_phenotype_annotation.tab \
    > /opt/Ontologies/Annotations/negative_phenotype_annotation.ttl \
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/Annotations/negative_phenotype_annotation.ttl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://localhost/negative_phenotype_annotation.ttl
