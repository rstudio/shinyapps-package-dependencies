options(download.file.method='curl')
install.packages('remotes', repos='https://cran.rstudio.com')
remotes::install_github("dirkschumacher/rcbc")

A <- matrix(c(1, 1), ncol = 2, nrow = 1)
result <- rcbc::cbc_solve(
  obj = c(1, 2),
  mat = A, # <- can also be a sparse matrix
  is_integer = c(TRUE, TRUE),
  row_lb = -Inf, row_ub = 1, max = TRUE,
  col_lb = c(0, 0), col_ub = c(1, 1),
  cbc_args = list("SEC" = "1"))