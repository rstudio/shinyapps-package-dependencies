options(download.file.method = "curl")
install.packages("pagedown", repos = "https://cran.rstudio.com", type = "source")

# Test against Chromium installation
pagedown::find_chrome()

# Functional test
source_file <- system.file(
  "rmarkdown/templates/html-paged/skeleton/skeleton.Rmd",
  package = "pagedown",
  mustWork = TRUE
)

pagedown::chrome_print(
  source_file, 
  tempfile(), 
  extra_args = c("--disable-gpu", "--no-sandbox"), 
  verbose = 1
)
