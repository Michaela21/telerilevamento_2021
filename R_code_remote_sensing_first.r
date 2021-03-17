# My first code in R for remote sensing!

#install.packages("raster") per importare i pacchetti all'interno di R dove sono presenti solo quelli base
library(raster)#richiama il pacchetto appena installato e verifico se ci sono stati problemi di installazione

setwd("C:/lab/") #windows, indica il percorso della cartella di lavoro

p224r63_2011 <- brick("p224r63_2011_masked.grd") #funzione che importa dato multilayer in R
p224r63_2011 #per vedere il contenuto del dato importato
plot(p224r63_2011) #stampa del dato

#colour change
cl <- colorRampPalette(c("black","grey", "light grey"))(100) # chiamo cl l'oggetto colorRampPalette che permette di cambiare i colori di una mappa, raggruppati in un vettore (array indicato con c e racchiusi tra parentesi), stabilendo i livelli di colore a disposizione (es 100). Col è un elemento della funzione plot e indica colore
plot(p224r63_2011, col=cl)

#colour change_new (esercizio con cambio di colori)
cl <- colorRampPalette(c("red","yellow", "cyan", "green"))(100)
plot(p224r63_2011, col=cl)
