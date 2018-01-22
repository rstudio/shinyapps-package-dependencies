# Install from CRAN
install.packages("sf", repos = "https://cran.rstudio.com")

# Run example
library(sf)
x = st_point(0:1)
y = st_point(3:4)
st_intersects(x, y)
