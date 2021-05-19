R_code_variability.r

setwd("C:/lab/")
library(raster)
library(RStoolbox)
library(ggplot2)

sentinel<- brick("sentinel.png")

# NIR 1, RED 2, GREEN 3
#r=1, g=2, b=3
plotRGB(sentinel) #uguale a plotRGB (sentinel, r=1, g=2, b=3, stretch="lin")

plotRGB (sentinel, r=2, g=1, b=3, stretch="lin")

#NDVI
nir <-sentinel$sentinel.1
red <-sentinel$sentinel.2
ndvi<- (nir-red)/(nir+red)
plot(ndvi)

cl<- colorRampPalette(c('black','white', 'red', 'magenta','green'))(100) 
plot(ndvi,col=cl)

# focal analysis (moving windows)
ndvisd3 <- focal(ndvi, w=matrix(1/9,nrow=3,ncol=3), fun=sd) #sulla base di pc1_devst <- focal(pc1, w=matrix(1/9,nrow=3,ncol=3), fun=sd) NO CORRETTA
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)#sulla base di pc1_devst <- focal(pc1, w=matrix(1/9,nrow=3,ncol=3), fun=sd)
plot(ndvisd3)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(ndvisd3, col=clsd)

ndvimean3 <- focal(ndvi, w=matrix(1/9,nrow=3,ncol=3), fun=mean)
plot(ndvimean3)
clmean <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(ndvimean3, col=clsd)

ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=sd)

