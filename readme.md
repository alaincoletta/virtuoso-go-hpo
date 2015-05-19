# Dockerfile: virtuoso-go-hpo
A dockerfile to download Gene Ontology (GO), Human Phenotype Ontology (HPO), and HPO Annotation (HPA) followed by importing them into Virtuoso

```bash
$ sudo docker run -d -p 8890:8890 --name virtuoso inutano/virtuoso
$ sudo docker run -it --link virtuoso:virtuoso -v ${HOME}/samples:/opt/Ontologies/samples misshie/virtuoso-go-hpo
$ curl \
     --form "query=SELECT COUNT(?s) FROM <http://purl.obolibrary.org/obo/go/go.owl> WHERE { ?s ?p ?o . }" \
     http://localhost:8890/sparql
$ curl \
     --form "query=SELECT COUNT(?s) FROM <http://purl.obolibrary.org/obo/hp.owl> WHERE { ?s ?p ?o . }" \
     http://localhost:8890/sparql
$ curl \
     --form "query=SELECT COUNT(?s) FROM <http://localhost/hpa.owl> WHERE { ?s ?p ?o . }" \
     http://localhost:8890/sparql
```
