#Time series analysis
#Greeland increase of temperature
#Data and code from Emanuela Cosma

#install.packages("ggplot2")
#install.packages("rasterVis")

#install.pakages("raster")
library(raster)

setwd("C:/lab/greenland")#indicare cartella di lavoro

lst_2000 <- raster("lst_2000.tif")# importo il singolo raster, rinominandolo, in R
plot(lst_2000)
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#list of files
rlist <- list.files(pattern="lst")#crea lista di file e li nomina vcome oggetto
rlist #per vedere la lista dei file

import <-lapply (rlist,raster) #caricare in R la lista dei file precedentemente creata

TGr <- stack(import)#per creare un unico file di raster 

plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
