options(download.file.method="curl")
install.packages("staplr", repos="https://cran.rstudio.com")

pdfFile = system.file('testForm.pdf',package = 'staplr')
fields = staplr::get_fields(pdfFile)

fields$TextField1$value = 'this is text'
fields$TextField2$value = 'more text'

filledFile = tempfile(fileext = '.pdf')
staplr::set_fields(pdfFile,filledFile,fields)


if (!file.exists(filledFile)) {
    stop("pdftk does not work")
}
