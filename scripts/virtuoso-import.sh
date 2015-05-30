#!/bin/bash

echo
echo ">>> Upload HPO into Virtuoso"
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/HPO/hp.owl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://purl.obolibrary.org/obo/hp.owl
echo
echo ">>> Upload GO into Virtuoso"
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/GO/go.owl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://purl.obolibrary.org/obo/go/go.owl

echo
echo ">>> Convert phenotype_annotation_hpoteam.tab to Turtle"
ruby /opt/Ontologies/scripts/hpa2rdf/hpa2rdf.rb \
    /opt/Ontologies/HPA/phenotype_annotation_hpoteam.tab \
    > /opt/Ontologies/HPA/phenotype_annotation_hpoteam.ttl
wc -l /opt/Ontologies/HPA/phenotype_annotation_hpoteam.ttl
echo
echo ">>> Upload phenotype_annotation_hpoteam.ttl into Virtuoso"
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/HPA/phenotype_annotation_hpoteam.ttl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://misshie.jp/rdf/phenotype_annotation_hpoteam.ttl

echo
echo ">>> Convert phenotype_annotation.tab to Turtle"
ruby /opt/Ontologies/scripts/hpa2rdf/hpa2rdf.rb \
    /opt/Ontologies/HPA/phenotype_annotation.tab \
    > /opt/Ontologies/HPA/phenotype_annotation.ttl
wc -l /opt/Ontologies/HPA/phenotype_annotation.ttl
echo
echo ">>> Upload phenotype_annotation.ttl into Virtuoso"
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/HPA/phenotype_annotation.ttl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://misshie.jp/rdf/phenotype_annotation.ttl

echo
echo ">>> Convert negative_phenotype_annotation.tab to Turtle"
ruby /opt/Ontologies/scripts/hpa2rdf/hpa2rdf.rb \
    /opt/Ontologies/HPA/negative_phenotype_annotation.tab \
    > /opt/Ontologies/HPA/negative_phenotype_annotation.ttl
wc -l /opt/Ontologies/HPA/negative_phenotype_annotation.ttl
echo
echo ">>> Upload negative_phenotype_annotation.ttl into Virtuoso"
curl --verbose --digest -u dba:dba \
    -T /opt/Ontologies/HPA/negative_phenotype_annotation.ttl \
    --url http://virtuoso:8890/sparql-graph-crud-auth?graph-uri=http://misshie.jp/rdf/negative_phenotype_annotation.ttl
