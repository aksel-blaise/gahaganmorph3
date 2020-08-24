# load package
#devtools::install_github("akiopteryx/lambda")
library(LaMBDA)

# set working directory
setwd(getwd())
source('readmulti.csv.R')

# read .csv files
setwd("./data")
filelist <- list.files(pattern = ".csv")
lmdata <- readmulti.csv(filelist)
setwd("../")

# analysis
lasec(coord.data = lmdata, n.dim = 3, iter = 10)
