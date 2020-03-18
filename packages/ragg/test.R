install.packages("ragg", repos="https://cran.rstudio.com")
library(ragg)

tmpfile <- tempfile(fileext = ".png")
ragg::agg_png(tmpfile)
plot(1:10)
dev.off()
unlink(tmpfile, recursive = TRUE)
