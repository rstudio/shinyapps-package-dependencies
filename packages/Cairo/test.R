options(download.file.method="curl")
install.packages("Cairo", repos = "https://cran.rstudio.com")

library("Cairo")

CairoWin(5,5)

CairoPNG(filename = "c:/Users/yourname/nice.png", width = 600, height = 600)

dev.off()
