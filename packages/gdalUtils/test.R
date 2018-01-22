options(download.file.method="curl")
install.packages("rgdal", repos = "https://cran.rstudio.com")

library("gdalUtils")

gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
