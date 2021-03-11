install.packages("docxtractr", repos = "https://cran.rstudio.com")

mytempdir = tempdir()
mydestfile = tempfile(tmpdir = mytempdir, fileext = ".doc")
dl = download.file(url = "http://www.iiswc.org/iiswc2013/sample.doc", destfile = mydestfile)

docxtractr:::lo_find()
res = docxtractr::read_docx(mydestfile)
