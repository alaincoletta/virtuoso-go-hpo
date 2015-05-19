#
# Impoting Gene Ontology (GO) and Human Phenotype Ontology (HPO) into Virtuoso
#
# version 0.1

FROM dockerfile/ubuntu
MAINTAINER MISHIMA, Hiroyuki <missy@be.to>

RUN mkdir -p /opt/Ontologies/HPO
RUN curl \
http://compbio.charite.de/hudson/job/hpo/lastStableBuild/artifact/hp/hp.owl \
-o /opt/Ontologies/HPO/hp.owl

RUN mkdir -p /opt/Ontologies/GO
RUN curl \
http://geneontology.org/ontology/go.owl \
-o /opt/Ontologies/GO/go.owl

RUN mkdir -p /opt/Annotations/HPO
RUN curl \
http://compbio.charite.de/hudson/job/hpo.annotations/lastStableBuild/artifact/misc/phenotype_annotation.tab \
-o /opt/Annotations/phenotype_annotation.tab

ADD scripts /opt/Ontologies/scripts
ADD samples /opt/Ontologies/samples

CMD /opt/Ontologies/virtuoso-import.sh



