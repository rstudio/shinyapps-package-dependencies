options(download.file.method="curl")
install.packages('bedr', repos="https://cran.rstudio.com", quiet=T)
install.packages('testit', repos="https://cran.rstudio.com", quiet=T)

library(bedr)
library(testit)

assert(check.binary(x = "bedtools", verbose = F))
assert(check.binary(x = "bedops", verbose = F))
assert(check.binary(x = "tabix", verbose = F))
