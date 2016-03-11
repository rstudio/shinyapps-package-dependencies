options(download.file.method="curl")
install.packages("Rpoppler", repos="https://cran.rstudio.com")
file <- system.file(file.path("doc", "Sweave.pdf"), package = "utils")
Rpoppler::PDF_info(file)
