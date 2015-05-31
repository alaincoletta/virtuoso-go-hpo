log_enable(2,1);

DB.DBA.RDF_LOAD_RDFXML_MT 
(file_to_string_output('/usr/local/virtuoso-opensource/var/lib/virtuoso/db/hp.owl'),
'',
'http://purl.obolibrary.org/obo/hp.owl');

DB.DBA.RDF_LOAD_RDFXML_MT
(file_to_string_output('/usr/local/virtuoso-opensource/var/lib/virtuoso/db/go.owl'),
'',
'http://purl.obolibrary.org/obo/go/go.owl');

DB.DBA.TTLP_MT
(file_to_string_output('/usr/local/virtuoso-opensource/var/lib/virtuoso/db/phenotype_annotation_hpoteam.ttl'),
'',
'http://misshie.jp/rdf/phenotype_annotation_hpoteam.ttl');

DB.DBA.TTLP_MT
(file_to_string_output('/usr/local/virtuoso-opensource/var/lib/virtuoso/db/phenotype_annotation.ttl'),
'',
'http://misshie.jp/rdf/phenotype_annotation.ttl');

DB.DBA.TTLP_MT
(file_to_string_output('/usr/local/virtuoso-opensource/var/lib/virtuoso/db/negative_phenotype_annotation.ttl'),
'',
'http://misshie.jp/rdfnegative_/phenotype_annotation.ttl');

EXIT;
