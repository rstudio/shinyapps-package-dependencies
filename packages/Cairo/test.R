options(download.file.method="curl")
install.packages("Cairo", repos = "https://cran.rstudio.com")

library("Cairo")

if (!Cairo.capabilities()["harfbuzz"]) {
  cat("Error: Harfbuzz is not available. This script requires harfbuzz.\n")
  quit(status = 1)
} 
