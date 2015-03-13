# Test script for V8 package on shinyapp.io
install.packages("V8", repos="http://cran.rstudio.com/")
library(V8)
# Create a new context
ct <- new_context();

# Evaluate some code
ct$eval("var foo = 123")
ct$eval("var bar = 456")
ct$eval("foo+bar")
