options(download.file.method="curl")
install.packages("symengine", repos="https://cran.rstudio.com")
devtools::install_github("symengine/symengine.R")

x <- symengine::S("x")
