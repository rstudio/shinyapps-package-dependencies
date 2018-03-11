# Install from CRAN
install.packages("lwgeom", repos = "https://cran.rstudio.com")

# Run example
library(sf)
x = st_point(0:1)
y = st_point(3:4)
library(lwgeom)
st_transform_proj(st_sfc(x, y, crs = 4326), "+init=epsg:3587")
