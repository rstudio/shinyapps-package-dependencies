options(download.file.method="curl")
install.packages("RSelenium", repos="https://cran.rstudio.com")
pJS <- RSelenium::phantom()
pJS$stop()
