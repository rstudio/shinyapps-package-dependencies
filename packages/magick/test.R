# Install from CRAN
install.packages("magick", repos = "https://cran.rstudio.com")

# Run example from the manual
library(magick)
docdir <- Sys.getenv("R_DOC_DIR", R.home("doc"))
img <- magick::image_read(file.path(docdir, "html", "logo.jpg"))

# Create a pdf
image_write(wizard,
            tempfile(pattern = "pdftemp", fileext = '.pdf'),
            density = 55,
            format = 'pdf',
            comment = "Edit PDFs and Images"
)
