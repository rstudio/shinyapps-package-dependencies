options(download.file.method="curl")
install.packages("udunits2", repos="https://cran.rstudio.com")
udunits2::ud.are.convertible("miles", "km")
