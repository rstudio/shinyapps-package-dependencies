options(download.file.method="curl")
install.packages("tesseract", repos="https://cran.rstudio.com")

library("tesseract")

# Both samples are checked-in images rather than remote ones, so the test does
# not depend on an image host staying reachable and unthrottled.
image <- function(name) file.path("packages", "tesseract", name)

text_eng <- ocr(image("english.png"), engine = tesseract("eng"))
stopifnot(
  grepl("The quick brown fox jumps over the lazy dog.", text_eng, fixed = TRUE),
  grepl("Shipping 1,024 widgets on 30 March 2026.", text_eng, fixed = TRUE)
)

text_fra <- ocr(image("french.png"), engine = tesseract("fra"))
stopifnot(
  grepl("les élèves français", text_fra, fixed = TRUE),
  grepl("Où êtes-vous allés déjeuner ce midi ?", text_fra, fixed = TRUE)
)
