## March 15th 2021

### UPDATED
* Updated many packages to support focal as a base OS
    * `docxtractr` has a bug that causes it to not work in focal, opened an issue: https://github.com/rstudio/shinyapps-package-dependencies/issues/282

### REMOVED
* `websocket` no longer needs any extra packages installed to function properly
* `rPython` no longer needs any extra packages installed to function properly

## March 11th 2021

### ADDED
* `textshaping` added support for harfbuzz

## March 10th 2021

### UPDATED
* `RSelenium` now sets `geckover = NULL` since downloading `geckodriver` was breaking the tests
* `ragg` add 2 required system packages to the install

### REMOVED
* `rtiff` was removed from CRAN on January 20th 2021.  Therefore we've removed it as well.
