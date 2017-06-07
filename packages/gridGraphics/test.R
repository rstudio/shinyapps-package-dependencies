# Install from CRAN
install.packages("gridGraphics", repos = "https://cran.rstudio.com")

library("gridGraphics")

# Echo existing drawing
plot(1)
grid.echo()
# Echo result of call to a plotting function
plotfun <- function() plot(1:10)
grid.echo(plotfun)
# Echo result of a plotting function (anonymous) into current viewport
grid.newpage()
pushViewport(viewport(x=0, width=.5, just="left"))
grid.rect(gp=gpar(col=NA, fill="grey"))
grid.echo(function() plot(1:10), newpage=FALSE)
