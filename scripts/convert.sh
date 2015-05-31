#!/bin/bash
dbdir=/usr/local/virtuoso-opensource/var/lib/virtuoso/db

echo
echo ">>> Convert phenotype_annotation_hpoteam.tab to Turtle"
ruby /opt/Ontologies/scripts/hpa2rdf/hpa2rdf.rb \
    /opt/Ontologies/scripts/hpa2rdf/phenotype_annotation_hpoteam.tab \
    > ${dbdir}/phenotype_annotation_hpoteam.ttl

echo
echo ">>> Convert phenotype_annotation.tab to Turtle"
ruby /opt/Ontologies/scripts/hpa2rdf/hpa2rdf.rb \
    /opt/Ontologies/scripts/hpa2rdf/phenotype_annotation.tab \
    > ${dbdir}/phenotype_annotation.ttl

echo
echo ">>> Convert negative_phenotype_annotation.tab to Turtle"
ruby /opt/Ontologies/scripts/hpa2rdf/hpa2rdf.rb \
    /opt/Ontologies/scripts/hpa2rdf/negative_phenotype_annotation.tab \
    > ${dbdir}/negative_phenotype_annotation.ttl
