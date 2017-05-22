options(download.file.method="curl")
install.packages("tensorflow", repos="https://cran.rstudio.com")
library('tensorflow')
sess <- tf$Session()
