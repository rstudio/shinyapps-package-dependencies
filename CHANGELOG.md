## October 31st 2023

### Added
 * Convention to mark packages as no longer officially supported. Packages with an `UNSUPPORTED` file
   in their directory will not be subject to testing, but may still work for you, espeically if your
   application uses an old version of the package.

   Packages may be marked unsupported for a variety of reasons, but commonly because they have been
   removed from CRAN.

### Removed
 * `rgdal` and `rgeos` is marked unsupported because they were removed from CRAN.

## September 22nd 2023

### Added
 * Dockerfile and `make` / CI configurations for an Ubuntu jammy (22.04)-based environment.

### UPDATED
 * Updated packages as necessary to support jammy as a base OS.
    * `dockxtractr` is available in jammy, but the installation currently supports .docx only, not .doc.

### REMOVED
 * `magick` no longer needs any extra packages installed to function properly.
 * `convertGraph` was removed from CRAN and has only one archived release from 2016, so is not being supported in this repository.

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
