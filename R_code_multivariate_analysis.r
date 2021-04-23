# R_code_multivariate_analysis.r
library(raster)
library(RStoolbox)

setwd("C:/lab/")
p224r63_2011<- brick("p224r63_2011_masked.gri")
plot(p224r63_2011)
p224r63_2011 #plot per vedere nomi delle bande

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2) #per plottare valori della b1 contro valori B2, phc stabilisce il font del carattere
# plot used a sample of 2.2% of the cells. You can use "maxpixels" to increase the sample).....warning del comando precedente che avvisa che verranno usati solo il 2.2% dei pixel totali per fare il plot

plot(p224r63_2011$B2_sre, p224r63_2011$B1_sre, col="red", pch=19, cex=2)#invertire assi

pairs(p224r63_2011)
