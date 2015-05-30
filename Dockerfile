#
# Impoting Gene Ontology (GO), Human Phenotype Ontology (HPO) and HPO annotation into Virtuoso
#
# version 0.1

# This Dockerfile is based on inutano/virtioso 
# MAINTAINER Tazro Inutano Ohta, inutano@gmail.com
# installing Virtuoso VERSION 0.1

MAINTAINER MISHIMA, Hiroyuki <missy@be.to>

# Pull base image.
#FROM dockerfile/ubuntu
FROM ruby/2.2

# Install packages.
RUN apt-get update && \
    apt-get install -y automake gperf libtool flex bison libssl-dev && \
    rm -rf /var/lib/apt/lists/*

# Install virtuoso
ENV VIRTUOSO_VERSION develop/7
RUN \
  cd /tmp && \
  git clone https://github.com/openlink/virtuoso-opensource.git && \
  cd virtuoso-opensource && \
  git checkout $VIRTUOSO_VERSION && \
  ./autogen.sh && \
  export CFLAGS="-O2 -m64" && \
  ./configure && \
  make && \
  make install && \
  rm -fr /tmp/virtuoso-opensource

# Define working directory.
WORKDIR /data

# Start Virtuoso
WORKDIR /usr/local/virtuoso-opensource/var/lib/virtuoso/
RUN \
  chown -R `whoami` db

# Define default command.
WORKDIR /usr/local/virtuoso-opensource/var/lib/virtuoso/db
RUN \
  /usr/local/virtuoso-opensource/bin/virtuoso-t +foreground

# Expose ports.
#   - 8890: HTTP
EXPOSE 8890

##########
RUN mkdir -p /opt/Ontologies/HPO
RUN curl \
http://compbio.charite.de/hudson/job/hpo/lastStableBuild/artifact/hp/hp.owl \
-o /opt/Ontologies/HPO/hp.owl

RUN mkdir -p /opt/Ontologies/GO
RUN curl \
http://geneontology.org/ontology/go.owl \
-o /opt/Ontologies/GO/go.owl

RUN mkdir -p /opt/Ontologies/HPA
RUN curl \
http://compbio.charite.de/hudson/job/hpo.annotations/lastStableBuild/artifact/misc/phenotype_annotation.tab \
-o /opt/Ontologies/HPA/phenotype_annotation.tab
RUN curl \
http://compbio.charite.de/hudson/job/hpo.annotations/lastStableBuild/artifact/misc/phenotype_annotation_hpoteam.tab \
-o /opt/Ontologies/HPA/phenotype_annotation_hpoteam.tab
RUN curl \
http://compbio.charite.de/hudson/job/hpo.annotations/lastStableBuild/artifact/misc/negative_phenotype_annotation.tab \
-o /opt/Ontologies/HPA/negative_phenotype_annotation.tab

ADD scripts /opt/Ontologies/scripts
ADD samples /opt/Ontologies/samples

CMD /opt/Ontologies/scripts/virtuoso-import.sh



