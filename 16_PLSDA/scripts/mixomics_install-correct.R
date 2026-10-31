##install BiocManager if not installed if (!requireNamespace("BiocManager", quietly = TRUE))     
install.packages("BiocManager") 
## install mixOmics 
BiocManager::install('mixOmics')