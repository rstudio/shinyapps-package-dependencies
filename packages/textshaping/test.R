options(download.file.method="curl")
install.packages("textshaping", repos="https://cran.rstudio.com")
textshaping::text_width("test string")
