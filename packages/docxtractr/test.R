if (system('lsb_release -sr', intern=TRUE) == "20.04") {
print("docxtractr is not supported on 20.04 due to https://github.com/rstudio/shinyapps-package-dependencies/issues/282")
} else {
install.packages("docxtractr", repos = "https://cran.rstudio.com")

mytempdir = tempdir()
mydestfile = tempfile(tmpdir = mytempdir, fileext = ".doc")
dl = download.file(url = "http://www.iiswc.org/iiswc2013/sample.doc", destfile = mydestfile)

docxtractr:::lo_find()
res = docxtractr::read_docx(mydestfile)
}
