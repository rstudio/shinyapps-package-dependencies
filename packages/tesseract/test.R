options(download.file.method="curl")
install.packages("tesseract", repos="https://cran.rstudio.com")

library("tesseract")

text <- ocr("https://jeroen.github.io/images/testocr.png")
nchar(text) == 287
