options(download.file.method="curl")
install.packages("animation", repos="https://cran.rstudio.com")

animation::saveGIF({
	animation::ani.options(nmax = 30)
	animation::brownian.motion(pch = 21, cex = 5, col = "red", bg = "yellow")
}, interval = 0.05, movie.name = "bm_demo.gif", ani.width = 600, ani.height = 600)

animation::saveVideo({
	par(mar = c(3, 3, 1, 0.5), mgp = c(2, 0.5, 0), tcl = -0.3, cex.axis = 0.8,
	cex.lab = 0.8, cex.main = 1)
	animation::ani.options(interval = 0.05, nmax = 300)
	animation::brownian.motion(pch = 21, cex = 5, col = "red", bg = "yellow")
}, video.name = "BM.mp4", other.opts = "-pix_fmt yuv420p -b 300k")
