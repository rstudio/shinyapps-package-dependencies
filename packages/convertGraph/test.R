options(download.file.method="curl")
install.packages("convertGraph", repos="https://cran.rstudio.com")
convertGraph::convertGraph("./example.svg", "./example.png", path="/usr/bin/phantomjs")
