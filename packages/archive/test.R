options(download.file.method="curl")
install.packages("archive", repos = "https://cran.rstudio.com")
library(archive)


## https://archive.r-lib.org/reference/archive_write_files.html

# write some files to a directory
d <- tempfile()
dir.create(d)
old <- setwd(d)

write.csv(iris, file.path(d, "iris.csv"))
write.csv(mtcars, file.path(d, "mtcars.csv"))
write.csv(airquality, file.path(d, "airquality.csv"))

# Add some to a new archive
a <- archive_write_files("data.tar.gz", c("iris.csv", "mtcars.csv"))
setwd(old)
a

# Add all files in a directory
a <- archive_write_dir("data.zip", d)
a

unlink("data.zip")
