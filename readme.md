# Dockerfile: virtuoso-go-hpo
A dockerfile to invoke virtuoso to import downloaded and converted Gene Ontology (GO), Human Phenotype Ontology (HPO), and HPO Annotation (HPA) data files

# Build
At the directory containing the Dockerfile file:
```bash
$ sudo docker build -t virtuoso-go-hpo .
```

# Run
```bash
$ sudo docker run -it -p 8890:8890 virtuoso-go-hpo
```

The SPARQL endpoint is available at http://localhost:8890/sparql .

```bash
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

# Author and License
Author:: MISHIMA, Hiroyuki / missy (at) be.to 

License:: The MIT License

The Dockerfile is based on 1) inutano/virtuoso written by Tazro Inutano Ohta at https://registry.hub.docker.com/u/inutano/virtuoso , and 2) http://qiita.com/k-shogo/items/592e243f9763d0c3b10a .


