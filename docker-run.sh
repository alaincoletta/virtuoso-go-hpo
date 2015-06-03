#!/bin/bash
bind=${HOME}/virtuoso-go-hpo

mkdir -p ${bind}
sudo docker \
    run \
    -it \
    -v /opt/Ontologies/samples:${bind}/samples \
    -v /opt/Ontologies/scripts:${bind}/scripts \
    -v /usr/local/virtuoso-opensource/var/lib/virtuoso/db:${bind}/db \
    -p 8890:8890 \
    virtuoso-go-hpo



    
