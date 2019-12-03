if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager", repos = "http://cran.rstudio.com/")

BiocManager::install("ChemmineOB")
molRefs = forEachMol("SMILES","C1CCCCC1\ttest-compound-name",identity)
fingerprint_OB(molRefs,"FP3")
