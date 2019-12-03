if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager", repos = "http://cran.rstudio.com/")

BiocManager::install("ChemmineOB")
molRefs = ChemmineOB::forEachMol("SMILES","C1CCCCC1\ttest-compound-name",identity)
ChemmineOB::fingerprint_OB(molRefs,"FP3")
