# Returns the file currently being sourced or run with Rscript
thisFile <- function() {
  cmdArgs <- commandArgs(trailingOnly = FALSE)
  needle <- "--file="
  match <- grep(needle, cmdArgs)
  if (length(match) > 0) {
    # Rscript
    return(normalizePath(sub(needle, "", cmdArgs[match])))
  } else {
    # 'source'd via R console
    return(normalizePath(sys.frames()[[1]]$ofile))
  }
}
# set to `pak` folder
setwd(dirname(thisFile()))

os <- tryCatch({
  system("lsb_release -sc", intern = TRUE)
}, error = function(e) {
  "local"
})

args <- commandArgs(TRUE)
if (length(args) > 0) {
  pkgs <- args[-1]

  # Must match install file
  lib <- file.path("lib", os, paste0(R.Version()$major, ".", R.Version()$minor))
  # Load pak from our tmp lib
  require("pak", character.only = TRUE, lib.loc = lib, quietly = TRUE)

  lapply(pkgs, function(pkg) {
    pak::pkg_system_requirements(pkg, execute = TRUE, sudo = TRUE)
  })
}
