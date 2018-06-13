options(download.file.method="curl")
install.packages("igraph", repos="https://cran.rstudio.com")

library(igraph)

## Zachary's karate club
g <- make_graph("Zachary")
## We put everything into a big 'try' block, in case
## igraph was compiled without GLPK support
## The calculation only takes a couple of seconds
oc <- cluster_optimal(g)
## Double check the result
print(modularity(oc))
print(modularity(g, membership(oc)))
## Compare to the greedy optimizer
fc <- cluster_fast_greedy(g)
print(modularity(fc))
