options(download.file.method="curl")
install.packages("RSelenium", repos="https://cran.rstudio.com")
rD <- RSelenium::rsDriver(browser = "phantomjs")
rD[["server"]]$stop()
