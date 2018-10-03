options(download.file.method="curl")
install.packages("av", repos="https://cran.rstudio.com")

# from av_demo
output = tempfile(fileext = ".mp4")
width = 960; 
height = 720
framerate = 5
verbose = TRUE

wonderland <- system.file("samples/Synapsis-Wonderland.mp3", 
                          package = "av", mustWork = TRUE)
info <- av::av_video_info(wonderland)
len <- framerate * round(info$duration)
res <- round(72 * min(width, height)/480)
col <- c("#8DD3C7", "#FFFFB3", "#BEBADA", "#FB8072", "#80B1D3", 
         "#FDB462", "#B3DE69", "#FCCDE5", "#D9D9D9", "#BC80BD", 
         "#CCEBC5", "#FFED6F")
cap = function(output) {
  av::av_capture_graphics(
    output = output, audio = wonderland, 
    {
      for (i in seq_len(len)) {
        if (as.logical(verbose)) 
          cat(sprintf("\rGenerating plot %d/%d...", i, 
                      len), file = stderr())
        graphics::hist(stats::rnorm(100), col = col, 
                       main = sprintf("frame %d/%d", i, len))
      }
      if (as.logical(verbose)) 
        cat("done!\n", file = stderr())
    }, width = width, height = height, res = res, framerate = framerate, 
    verbose = verbose)
}

cap(output)
stopifnot(file.exists(output))

output = tempfile(fileext = ".mkv")
cap(output)
stopifnot(file.exists(output))

output = tempfile(fileext = ".mov")
cap(output)
stopifnot(file.exists(output))

output = tempfile(fileext = ".flv")
cap(output)
stopifnot(file.exists(output))

