#R_code_vegetation_indices.r
library(raster)#si può usare anche require(raster)
library(RStoolbox)#per usare la funzione spectraIndices al posto di fare l'oporazione algebrica
#install.packages("rasterdiv")#for the worldwide ndvi
library(rasterdiv)
library(rasterVis)


defor1<-brick("defor1.jpg")
defor2<-brick("defor2.jpg")

# b1=NIR, b2=red, b3=green
par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#difference vegetation

dvi1 <- defor1$defor1.1 - defor1$defor1.2#DVI di derfor1
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl, main="DVI at time 1")

dvi2 <- defor2$defor2.1 - defor2$defor2.2#DVI immagine più recente (defor2)
plot(dvi2, col=cl, main="DVI at time 2")

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

#differnza tra dvi
difdiv <- dvi1-dvi2
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(difdiv, col=cld)

#NDVI (normalized difference vegetation indices)
# (NIR-Red)/(NIR+Red)
ndvi1<- (defor1$defor1.1 - defor1$defor1.2)/(defor1$defor1.1 + defor1$defor1.2)# uguale a dvi1/(defor1$defor1.1 + defor1$defor1.2)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndvi1, col=cl)


ndvi2<- (defor2$defor2.1 - defor2$defor2.2)/(defor2$defor2.1 + defor2$defor2.2)# uguale a dvi1/(defor1$defor1.1 + defor1$defor1.2)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndvi2, col=cl)

#Nel pacchetto RStoolbox si può usare il pacchetto spectralIndices

vi1 <- spectralIndices(defor1, green = 3, red = 2, nir = 1)
plot(vi1, col=cl)

vi2 <- spectralIndices(defor1, green = 3, red = 2, nir = 1)
plot(vi2, col=cl)

#differenza ndvi
ndifdiv <- ndvi1-ndvi2
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(ndifdiv, col=cld)

#worldwide NDVI
#library(raster)
#library(rasterdiv)
#library(rasterVis)
#data(copNDVI), non usato a lezione ma presente nel codice su virtuale
plot(copNDVI)
copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) #per togliere l'acqua usare cbind (serve per cambiare dei codici, valori DN: i pixel con valore 253,254,255 possono essere trasformati in NA, non disponibile). Con i : si inca il range
levelplot(copNDVI)#per vedere profili del valore medio di righe e colonne


 e ,
