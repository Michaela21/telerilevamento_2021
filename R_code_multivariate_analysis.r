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

#aggregate cells:resempling (ricampionamento)
p224r63_2011res <- aggregate(p224r63_2011, fact=10)#ricampionamento di un fattore 10
p224r63_2011res
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

p224r63_2011res_pca<-rasterPCA(p224r63_2011res)#analisi pca

summary(p224r63_2011res_pca$model)#sommrio del modello
plot(p224r63_2011res_pca$map)#per stampare le componenti PCA

p224r63_2011res_pca#visualizza le varie informazioni contenute nell'output generato (mappa, modello...)

plotRGB(p224r63_2011res_pca$map,r=1, g=2, b=3, stretch="lin")#visualizzazione in RGB con le prime 3 componenti generate 
plot(p224r63_2011res_pca$map$PC1,p224r63_2011res_pca$map$PC2)#plottore i valori di una banda PCA rispetto ad un'altra banda PCA

#per avere informzioni aggiuntive del dato, ancge sulla struttura informatica
str(p224r63_2011res_pca)
