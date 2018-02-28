# Install from CRAN
install.packages("lwgeom", repos = "https://cran.rstudio.com")

# Run example from the manual
library(lwgeom)
library(sf)
x = st_sfc(st_polygon(list(rbind(c(0,0),c(0.5,0),c(0.5,0.5),c(0.5,0),c(1,0),c(1,1),c(0,1),c(0,0)))))
y = lwgeom::st_make_valid(x)