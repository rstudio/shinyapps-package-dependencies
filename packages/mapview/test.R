# Install from CRAN
install.packages("mapview", repos = "https://cran.rstudio.com")

# Run examples

library(mapview)

mapview(breweries) # Easiest test, on lat-long data
mapview(poppendorf[[5]]) # This test requires re-projection