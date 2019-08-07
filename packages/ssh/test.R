options(download.file.method="curl")
install.packages("ssh", repos="https://cran.rstudio.com")

ssh::libssh_version()
