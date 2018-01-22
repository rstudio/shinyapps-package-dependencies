# there is (as of 2017-07-07) no package on CRAN that uses pdf2svg (afaik), so this test is just base R.
# https://github.com/maxheld83/pensieve *does* use pdf2svg and will be on CRAN in future; this test should suffice though
# more info on the pdf2svg utility at http://www.cityinthesky.co.uk/opensource/pdf2svg/
# pdf2svg requires poppler and cairo, both of which are already listed as dependencies in shinyapps-package-dependencies
install.packages(
  pkgs = c("devtools", "withr"),
  repos = "https://cran.rstudio.com"
)
devtools::install_github(repo = "maxheld83/pensieve")

library(pensieve)
list.files(recursive = TRUE)
path <- file.path("packages", "pensieve")
file.exists(file.path(path, "test1.pdf"))  # this already fails
with_dir(new = path, code = {
  system2(command = "pdf2svg",
          args = c("test1.pdf", "test1.svg", "1"),
          stderr = "")
  if (file.exists("test1.svg")) {
    file.remove("test1.svg")
  } else {
    stop("No converted svg file found.")
  }
})

