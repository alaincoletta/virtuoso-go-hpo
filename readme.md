docker run -d -p 8890:8890 --name virtuoso inutano/virtuoso
docker run -it --link virtuoso:virtuoso misshie/virtuoso-go-hpo

curl \
     --form "query=SELECT COUNT(?s) FROM <http://purl.obolibrary.org/obo/go/go.owl> WHERE { ?s ?p ?o . }" http://localhost:8890/sparql

aaaa



SELECT * FROM <http://localhost/ontologies/go> where {?s ?p ?o .}