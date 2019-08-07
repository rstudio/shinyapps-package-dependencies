options(download.file.method = "curl")
install.packages("docxtractr", repos = "https://cran.rstudio.com")

destfile = tempfile(fileext = ".doc")
dl = download.file(url = "http://www.iiswc.org/iiswc2013/sample.doc",
                   destfile = destfile)

docxtractr:::lo_find()
res = docxtractr::read_docx(destfile)
