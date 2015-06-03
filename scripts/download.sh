#!/bin/bash
dbdir=/usr/local/virtuoso-opensource/var/lib/virtuoso/db

curl \
    http://compbio.charite.de/hudson/job/hpo/lastStableBuild/artifact/hp/hp.owl \
    -o ${dbdir}/hp.owl

curl \
    http://geneontology.org/ontology/go.owl \
    -o ${dbdir}/go.owl

curl \
    http://compbio.charite.de/hudson/job/hpo.annotations/lastStableBuild/artifact/misc/phenotype_annotation.tab \
    -o /opt/Ontologies/scripts/hpa2rdf/phenotype_annotation.tab
curl \
    http://compbio.charite.de/hudson/job/hpo.annotations/lastStableBuild/artifact/misc/phenotype_annotation_hpoteam.tab \
    -o /opt/Ontologies/scripts/hpa2rdf/phenotype_annotation_hpoteam.tab
curl \
    http://compbio.charite.de/hudson/job/hpo.annotations/lastStableBuild/artifact/misc/negative_phenotype_annotation.tab \
    -o /opt/Ontologies/scripts/hpa2rdf/negative_phenotype_annotation.tab

curl \
    http://gendoo.dbcls.jp/data/omim2ja.tab \
    -o /opt/Ontologies/scripts/gendoo2rdf/omim2ja.tab


