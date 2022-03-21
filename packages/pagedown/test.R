options(download.file.method = "curl")
install.packages("pagedown", repos = "https://cran.rstudio.com", type = "source")

# Test against Chromium installation
pagedown::find_chrome()

# Test PDF generation (functional test)
pagedown::chrome_print(
    file.path(R.home("doc"), "html", "about.html"),
    tempfile(fileext = ".pdf"),
    # use --no-sandbox flag because this code is executed in a container
    extra_args = c("--disable-gpu", "--no-sandbox"),
    # for diagnosis on failure
    verbose = 2
)
