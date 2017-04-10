# Install from CRAN
install.packages("sf", repos = "https://cran.rstudio.com")

# Run example
library(sf)
x = st_point(0:1)
y = st_point(3:4)
st_intersects(x, y)

# st_make_valid:
x = st_sfc(st_polygon(list(rbind(c(0,0),c(0.5,0),c(0.5,0.5),c(0.5,0),c(1,0),c(1,1),c(0,1),c(0,0)))))
y = st_make_valid(x)
st_is_valid(y) # TRUE
