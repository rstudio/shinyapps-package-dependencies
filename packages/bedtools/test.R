# Check if bedtools is installed
is_bedtools_installed <- system("bedtools --version", intern=TRUE)

if (length(is_bedtools_installed) == 0) {
  print("bedtools is not installed.")
} else {
  print("bedtools is installed.")
}
