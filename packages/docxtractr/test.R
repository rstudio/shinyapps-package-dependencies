if (system('lsb_release -sr', intern=TRUE) == "20.04") {
print("docxtractr is not supported on 20.04 due to https://github.com/rstudio/shinyapps-package-dependencies/issues/282")
} else {
install.packages("docxtractr", repos = "https://cran.rstudio.com")

mytempdir = tempdir()
mydestfile = tempfile(tmpdir = mytempdir, fileext = ".docx")
dl = download.file(url = "https://filesamples.com/samples/document/docx/sample2.docx", destfile = mydestfile)

docxtractr:::lo_find()
res = docxtractr::read_docx(mydestfile)
}
