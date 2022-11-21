remotes::install_github("jfortin1/neuroCombatData")
remotes::install_github("Jfortin1/neuroCombat_Rpackage")

source("https://neuroconductor.org/neurocLite.R")

neuro_install('neuroCombat')


library(neuroCombat)
modelData2 <- read.csv('Chimp_CT.csv')
head(modelData2)
mod <- model.matrix(~ age + factor(sex)+factor(Scanner), data = modelData2)
ctData <- read.csv('imageData.csv')
head(ctData) [,1:104]
img <- t(ctData[,-1])
head(img) [,1:104]
batch <- modelData1$Scan
dat <- t(ctData[,-1])
harmonized <- neuroCombat(dat,batch,mod = TRUE, eb = TRUE, parametric = TRUE, mean.only = FALSE, ref.batch = NULL, verbose = TRUE)
