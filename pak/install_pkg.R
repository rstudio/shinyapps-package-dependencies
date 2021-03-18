
args <- commandArgs(TRUE)
if (length(args) > 0) {
  pkgs <- args[-1]

  # Must match install file
  lib <- file.path("pak", "lib", R.Version()$platform, paste0(R.Version()$major, ".", R.Version()$minor))
  # Load pak from our tmp lib
  require("pak", character.only = TRUE, lib.loc = lib, quietly = TRUE)

  lapply(pkgs, function(pkg) {
    pak::pkg_system_requirements(pkg, execute = TRUE, sudo = TRUE)
  })
}
