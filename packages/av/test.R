options(download.file.method="curl")
install.packages("av", repos="https://cran.rstudio.com")

# from av_demo
output = tempfile(fileext = ".mp4")
av::av_demo(output = output)
stopifnot(file.exists(output))

output = tempfile(fileext = ".mkv")
av::av_demo(output = output)
stopifnot(file.exists(output))

output = tempfile(fileext = ".mov")
av::av_demo(output = output)
stopifnot(file.exists(output))

output = tempfile(fileext = ".flv")
av::av_demo(output = output)
stopifnot(file.exists(output))

