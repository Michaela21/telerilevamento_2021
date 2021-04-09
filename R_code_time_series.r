#Time series analysis
#Greeland increase of temperature
#Data and code from Emanuela Cosma

#install.packages("ggplot2")
#install.packages("rasterVis")metodi di visualizzazione per dati raster

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
rlist <- list.files(pattern="lst")#crea lista di file che hanno una parte del nome comune(pattern) e li nomina come oggetto
rlist #per vedere la lista dei file

import <-lapply (rlist,raster) #caricare in R la lista dei file precedentemente creata

TGr <- stack(import)#per creare un unico file di raster 

plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")

library(rasterVis)
 
levelplot(TGr)

levelplot(TGr$lst_2000)#plotta la variabilità dei valori dei pixel delle singole colonne o righe

cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)#cambio i colori della palette per evidenziare i trend
levelplot(TGr, col.regions=cl)#col.regions è l'argomento per cambiare i colori all'interno di levelplot, richiama l'oggetto palette di colori da plottare

#per cambiare i titoli
levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))#gli attributi sono gli oggetti presenti (i 4 dati raster) e con names.attr si nomina gli attributi (titoli nella mappa)

levelplot(TGr,col.regions=cl,main="LST variation in time", names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))#con main inserisco titolo complessivo

#melt
meltlist <- list.files(pattern="melt")
meltlist   #avviso: controllare di aver rimosso la cartella dello zip o altre cartelle/file con nome contenente il pattern                            
melt_import <- lapply(meltlist,raster)
melt <- stack(melt_import)
melt

levelplot(melt)

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt#differenze di valori tra strati
clb <- colorRampPalette(c("blue","white","red"))(100)#associo nuovi colori
plot(melt_amount, col=clb)

levelplot(melt_amount, col.regions=clb)
 
