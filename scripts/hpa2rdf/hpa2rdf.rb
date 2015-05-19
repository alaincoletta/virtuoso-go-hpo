require "./hpa2rdf/turtle"
require "./hpa2rdf/hpo2ttl"
require "./hpa2rdf/version"

if $0 == __FILE__
  Hpa2rdf::Hpa2ttl.new.run
end
