install.packages("redland", repos = "http://cran.us.r-project.org")

library(redland)
world <- new("World")
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
model <- new("Model", world=world, storage, options="")
parser <- new("Parser", world)
parseFileIntoModel(parser, world, system.file("extdata", "dc.rdf", package="redland"), model)

queryString <- 'PREFIX dc: <http://purl.org/dc/elements/1.1/> SELECT ?a ?c WHERE { ?a dc:creator ?c . }'
query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
queryResult <- executeQuery(query, model)
results <- getResults(query, model)
cat(sprintf("Result from query: %s\n", results))
freeQuery(query)