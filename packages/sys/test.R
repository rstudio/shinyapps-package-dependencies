options(download.file.method="curl")
install.packages("sys", repos = "https://cran.rstudio.com")

library("sys")

eval_safe(rnorm(5))
sys_config()
aa_config()
