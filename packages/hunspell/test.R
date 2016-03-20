options(download.file.method = "curl")
install.packages("hunspell", repos = "https://cran.rstudio.com")
library(hunspell)
hunspell("I like cookiez")
