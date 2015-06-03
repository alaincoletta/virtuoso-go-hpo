#!/bin/bash
bind=${HOME}/virtuso-go-hpo

mkdir -p ${bind}
sudo docker \
    run \
    -it \
    -v ${bind}/samples:/opt/Ontologies/samples \
    -v ${bind}/scripts:/opt/Ontologies/scripts \
    -v ${bind}/db:/usr/local/virtuoso-opensource/var/lib/virtuoso/db \
    virtuoso-go-hpo \
    /bin/bash


    
