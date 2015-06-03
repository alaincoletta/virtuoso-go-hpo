#!/bin/bash
bind=${HOME}/virtuoso-go-hpo

mkdir -p ${bind}
sudo docker \
    run \
    -it \
    -v /opt/Ontologies/samples:${bind}/samples \
    -v /opt/Ontologies/scripts:${bind}/scripts \
    -v /usr/local/virtuoso-opensource/var/lib/virtuoso/db:${bind}/db \
    virtuoso-go-hpo



    
