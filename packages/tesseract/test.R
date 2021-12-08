options(download.file.method="curl")
install.packages("tesseract", repos="https://cran.rstudio.com")

library("tesseract")

text_eng <- ocr("https://jeroen.github.io/images/testocr.png", engine = (language = "eng"))
nchar(text_eng) == 286
text_fra <- ocr("https://upload.wikimedia.org/wikipedia/commons/a/ab/IGAS_Rapport.png", engine = (language = "fra"))
nchar(text_fra) == 3360
