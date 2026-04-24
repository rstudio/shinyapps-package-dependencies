options(download.file.method="curl")
install.packages("RSelenium", repos="https://cran.rstudio.com")
rD <- RSelenium::remoteDriver(
  remoteServerAddr = "localhost",
  port = 4445L,
  browserName = "firefox"
)
