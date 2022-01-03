# Install from CRAN
install.packages("arrow", repos = "https://cran.rstudio.com")

# Run example from the manual
library(arrow)
if (codec_is_available("snappy")) {
   print("all is good")
} else {
   stop("snappy support still missing")
}
