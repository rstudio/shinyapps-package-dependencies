options(download.file.method="curl")
install.packages("Rmpfr", repos="https://cran.rstudio.com")

## Using "mpfr" numbers instead of regular numbers...
n1.25 <- Rmpfr::mpfr(5, precBits = 256)/4
n1.25
## and then "everything" just works with the desired chosen precision:hig
n1.25 ^ c(1:7, 20, 30) ## fully precise; compare with
print(1.25 ^ 30, digits=19)
exp(n1.25)
