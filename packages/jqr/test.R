install.packages("jqr", repos = "https://cran.rstudio.com")
install.packages("jsonlite", repos = "https://cran.rstudio.com")

library(jsonlite)
library(jqr)

str <- '{"foo": 5, "bar": 7}'
jq(str, "keys")
