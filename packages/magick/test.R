# Install from CRAN
install.packages("magick", repos = "https://cran.rstudio.com")

# Run example from the manual
library(magick)
docdir <- Sys.getenv("R_DOC_DIR", R.home("doc"))
img <- magick::image_read(file.path(docdir, "html", "logo.jpg"))
