# Install from CRAN
install.packages("sodium", repos = "https://cran.rstudio.com")

# Run example from the manual
library(sodium)
key <- sha256(charToRaw("This is a secret passphrase"))
msg <- serialize(iris, NULL)
