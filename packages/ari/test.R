install.packages("ari", repos = "https://cran.rstudio.com")
install.packages("tuneR", repos = "https://cran.rstudio.com")
temp_dir <- tempdir()

n = 3
for (i in 1:n) {
  jpeg(file.path(temp_dir, 
  	paste0("plot", i, ".jpg")))
  plot(1:5 * i, 1:5, main = i)
  dev.off()
}

sound <- replicate(
  n, 
  tuneR::Wave(round(rnorm(88200, 127, 20)), 
              samp.rate = 44100, bit = 16))

graphs <- file.path(temp_dir, 
	paste0("plot", 1:n, ".jpg"))
video <- file.path(temp_dir, "output.mp4")

res = ari::ari_stitch(graphs, sound, output = video)
stopifnot(res)
