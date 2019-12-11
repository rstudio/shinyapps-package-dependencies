options(download.file.method = "curl")
install.packages("websocket", repos = "https://cran.rstudio.com", type = "source")

library(websocket)

timeout <- 30
websocket_test_passed <- FALSE

ws <- WebSocket$new("wss://echo.websocket.org", autoConnect = FALSE)
websocket_msg <- paste(sample(letters, 8), collapse = "")
ws$onMessage(function(event) {
  on.exit(ws$close())
  stopifnot(identical(event$data, websocket_msg))
  websocket_test_passed <<- TRUE
})
ws$onOpen(function(event) {
  ws$send(websocket_msg)
})
t0 <- Sys.time()
ws$connect()

while (as.numeric(difftime(Sys.time(), t0, units = "secs")) < timeout && ws$readyState() < 3) {
  later::run_now()
}
stopifnot(websocket_test_passed)
