# the pensieve package is (partly) closed source (and still unstable), but it *does* require the below dependencies.
# instead of the actual pensieve wrappers around the deps, here are essentially the same calls in base R
# more info on the pdf2svg utility at http://www.cityinthesky.co.uk/opensource/pdf2svg/
# pdf2svg requires poppler and cairo, both of which are already listed as dependencies in shinyapps-package-dependencies

# to make sure that the test cleans up after itself, all tests are wrapped in withr
install.packages("withr", repos = "https://cran.rstudio.com")
path <- file.path("shinyapps", "packages", "pensieve")

# test pdf2svg
withr::with_dir(new = path, code = {
  system2(
    command = "pdf2svg",
    args = c("test_pdf2svg.pdf", "test_pdf2svg.svg", "1"),
    stderr = ""
  )
  if (file.exists("test_pdf2svg.svg")) {
    file.remove("test_pdf2svg.svg")
  } else {
    stop("No converted svg file found; pdf2svg may not be working properly")
  }
})
withr::with_dir(new = path, code = {
  system2(
    command = "rsvg-convert",
    args = c(
      "-f",
      "pdf",
      "-o",
      "test_svg2pdf.pdf",
      "test_svg2pdf.svg"
    )
  )
  if (file.exists("test_svg2pdf.pdf")) {
    file.remove("test_svg2pdf.pdf")
  } else {
    stop("No converted pdf file found; rsvg-convert may not be working properly")
  }
})

