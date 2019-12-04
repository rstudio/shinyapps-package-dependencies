options(download.file.method = "curl")
install.packages("pagedown", repos = "https://cran.rstudio.com", type = "source")

# Test against Chromium installation
pagedown::find_chrome()
