options(download.file.method="curl")
install.packages("rgeos", repos="https://cran.rstudio.com")
rgeos::gArea(rgeos::readWKT("POINT(1 1)"))
