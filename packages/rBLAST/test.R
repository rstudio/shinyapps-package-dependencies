install.packages(c("BiocManager"), repos="https://cran.rstudio.com")
BiocManager::install(version = "3.22")
BiocManager::install("rBLAST")
library(rBLAST)
rBLAST::blast_help()

## check if makeblastdb is correctly installed
Sys.which("makeblastdb")

## see possible arguments
blast_help("makeblastdb")

## create a database for some example sequences
seq <- readRNAStringSet(system.file("examples/RNA_example.fasta",
    package="rBLAST"))

## 1. write the FASTA file
dir <- tempdir()
writeXStringSet(seq, filepath = file.path(dir, "seqs.fasta"))

## 2. make database
makeblastdb(file.path(dir, "seqs.fasta"), dbtype = "nucl")

## 3. open database
db <- blast(file.path(dir, "seqs.fasta"))

## 4. perform search (first sequence in the db should be a perfect match)
predict(db, seq[1])

## clean up
unlink(dir, recursive = TRUE)
