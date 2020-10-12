# load geomorph
#devtools::install_github("geomorphR/geomorph", ref = "Stable", build_vignettes = TRUE)
library(here)
library(geomorph)

source('readmulti.csv.R')

# read .csv files 2
setwd("./data.2d1")
filelist1 <- list.files(pattern = ".csv")
coords1 <- readmulti.csv(filelist1)
setwd("../")

# read .csv files 2
setwd("./data.3d1")
filelist2 <- list.files(pattern = ".csv")
coords2 <- readmulti.csv(filelist2)
setwd("../")

# gpa 1
Y.gpa1<-gpagen(coords1, 
              PrinAxes = TRUE, 
              print.progress = FALSE)

# gpa 2
Y.gpa2<-gpagen(coords2, 
              PrinAxes = TRUE, 
              print.progress = FALSE)

PLS <- two.b.pls(Y.gpa1$coords, Y.gpa2$coords, iter = 9999)
summary(PLS)
plot(PLS)


#####
# symmetry

# read .csv files
setwd("./data.2d1")
filelist3 <- list.files(pattern = ".csv")
coords3 <- readmulti.csv(filelist3)
setwd("../")

land.pairs3 <- read.csv("2dlmsymm.csv", header = TRUE)
ind3 <- rep(1:length(filelist3))

# read .csv files
setwd("./data.3d1")
filelist4 <- list.files(pattern = ".csv")
coords4 <- readmulti.csv(filelist4)
setwd("../")

# read qualitative data
qdata4 <- read.csv("qdata.csv", header = TRUE, row.names = 1)
qdata4 <- qdata4[match(dimnames(coords4)[[3]], rownames(qdata4)),]
land.pairs4 <- read.csv("asymmetry.csv", header = TRUE)
ind4 <- rep(1:length(filelist4))

# gpa - bilateral asymmetry 2d
res.bilat1 <- bilat.symmetry(coords3,
                            ind = ind3, 
                            object.sym = TRUE,
                            land.pairs = land.pairs3,
                            RRPP = TRUE,
                            iter = 9999,
                            print.progress = FALSE)
summary(res.bilat1)

# gpa - bilateral asymmetry 3d
res.bilat2 <- bilat.symmetry(coords4,
                            ind = ind4, 
                            object.sym = TRUE,
                            land.pairs = land.pairs4,
                            RRPP = TRUE,
                            iter = 9999,
                            print.progress = FALSE)
summary(res.bilat2)

# 2b-pls symmetry
symm.PLS <- two.b.pls(res.bilat1$symm.shape, res.bilat2$symm.shape, iter = 9999)
summary(symm.PLS)
plot(symm.PLS)

# 2b-pls asymmetry
asymm.PLS <- two.b.pls(res.bilat1$FA.component, res.bilat2$FA.component, iter = 9999)
summary(asymm.PLS)
plot(asymm.PLS)

# end of code
