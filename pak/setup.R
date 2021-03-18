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

# Must match install file
lib <- file.path("lib", os, paste0(R.Version()$major, ".", R.Version()$minor))
if (!dir.exists(lib)) {
  dir.create(lib, recursive = TRUE)
}

if (system.file(package = "pak", lib.loc = lib) == "") {
  # install latest
  install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/", lib = lib)
  # quick test
  require("pak", character.only = TRUE, lib.loc = lib, quietly = FALSE)

} else {
  # Load pak from our tmp lib
  require("pak", character.only = TRUE, lib.loc = lib, quietly = TRUE)
  # update to latest version
  pak::pak_update()
}
