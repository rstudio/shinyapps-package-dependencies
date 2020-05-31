# 0.2-3 (CRAN head as of 2020-05-20) fails to install on Ubuntu 16.04 due to:
# https://github.com/r-spatial/lwgeom/commit/08233333e7909c6c0ede0f50c94d9f5130f11c76
# GitHub (as of 2020-05-20) fails to install because it now requires GEOS >= 3.6.0, which Ubuntu GIS does
# not provide for Xenial.
install.packages("devtools", repos = "https://cran.rstudio.com")
devtools::install_version("lwgeom", version = "0.2-1", repos = "https://cran.rstudio.com")

# Run example
library(sf)
x = st_point(0:1)
y = st_point(3:4)
library(lwgeom)
st_transform_proj(st_sfc(x, y, crs = 4326), "EPSG:3857")
