options(download.file.method = "curl")

avail_pkgs <- unname(available.packages(repos = "https://cran.rstudio.com")[, "Package"])
if ("chromote" %in% avail_pkgs) {
  install.packages("chromote", repos = "https://cran.rstudio.com", type = "source")
} else {
  options(repos = c(CRAN="https://cran.rstudio.com"))
  install.packages(c("curl", "remotes"))
  remotes::install_github("rstudio/chromote", dependencies = TRUE)
}


library(chromote)

set_default_chromote_object(
  Chromote$new(
    Chrome$new(
      args = c(
        "--disable-gpu",
        "--no-sandbox",
        "--disable-dev-shm-usage", # required bc the target easily crashes
        c("--force-color-profile", "srgb")
      )
    )
  )
)

# Make session
b <- ChromoteSession$new()

# Download google.com
b$Page$navigate("https://www.rstudio.com/")

# Get the outer HTML of the document
outerHTML <- b$DOM$getOuterHTML(b$DOM$getDocument()$root$nodeId)$outerHTML
print(outerHTML)

# Yell if it doesn't find the close `html` tag; close tag is more consistent
stopifnot(grepl("</html>", outerHTML, fixed = TRUE))
