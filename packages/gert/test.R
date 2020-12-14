options(download.file.method="curl")

# gert fails at compile-time without a functioning libgit2 version on xenial
install.packages("gert", repos="https://cran.rstudio.com")
