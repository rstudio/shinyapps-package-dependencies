# Must match install file
lib <- file.path("pak", "lib", R.Version()$platform, paste0(R.Version()$major, ".", R.Version()$minor))
if (!dir.exists(lib)) {
  dir.create(lib, recursive = TRUE)
}

if (system.file(package = "pak", lib.loc = lib) == "") {
  # install latest
  install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/", lib = lib)
} else {
  # Load pak from our tmp lib
  require("pak", character.only = TRUE, lib.loc = lib, quietly = TRUE)
  # update to latest version
  pak::pak_update()
}
