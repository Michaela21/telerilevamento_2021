# My first code in R for remote sensing!

#install.packages("raster") per importare i pacchetti all'interno di R dove sono presenti solo quelli base
library(raster)#richiama il pacchetto appena installato e verifico se ci sono stati problemi di installazione

setwd("C:/lab/") #windows, indica il percorso della cartella di lavoro

p224r63_2011 <- brick("p224r63_2011_masked.grd") #funzione che importa dato multilayer in R
p224r63_2011 #per vedere il contenuto del dato importato
plot(p224r63_2011) #stampa del dato

### DAY 2
#colour change
cl <- colorRampPalette(c("black","grey", "light grey"))(100) # chiamo cl l'oggetto colorRampPalette che permette di cambiare i colori di una mappa, raggruppati in un vettore (array indicato con c e racchiusi tra parentesi), stabilendo i livelli di colore a disposizione (es 100). Col è un elemento della funzione plot e indica colore
plot(p224r63_2011, col=cl)

#colour change_new (esercizio con cambio di colori)
cl <- colorRampPalette(c("red","yellow", "cyan", "green"))(100)
plot(p224r63_2011, col=cl)

dev.off() # ripulisce la finestra grafica di tuuto quello che contiene

##DAY 3

# Landsat bands
# B1: blue
# B2: green
# B3: red
# B4: NIR
# B5: SWIR
# B6: THERMAL
# B7: SWIR 2


# plot band 1 with a predefined colut ramp palette

cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011$B1_sre, col=cls)

plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)# plot la banda 2 sovrascrivendo quella plottata in precedenza


# plot di più grafici organizzati secondo indicazioni di riga e colonna
par(mfrow=c(1,2))#1 row e 2 columns
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 row, 1 columns
par(mfrow=c(2,1))# se inserisco prima le colonne par(mfcol=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

#plot the first four bands
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

#plot the first four bands, 2 rows and 2 columns
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

#plot the first four bands whit color specific palette
par(mfrow=c(2,2))
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) 
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) 
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) 
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)


par(mfcol=c(2,2))
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) 
plot(p224r63_2011$B1_sre, col=clb)

clr <- colorRampPalette(c('dark red','red','pink'))(100) 
plot(p224r63_2011$B3_sre, col=clr)

clg <- colorRampPalette(c('dark green','green','light green'))(100) 
plot(p224r63_2011$B2_sre, col=clg)

clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)

##DAY 4
#Visulizing data by RGB data
library(raster)#richiama il pacchetto appena installato e verifico se ci sono stati problemi di installazione

setwd("C:/lab/") #windows
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

# Landsat bands
# B1: blue
# B2: green
# B3: red
# B4: NIR
# B5: SWIR
# B6: THERMAL
# B7: SWIR 2

#Natural colors 321
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

# False colors 432
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

#mount NIR ontop the G of RGB
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")

#324
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

#Excercise: mount a 2x2 multiframe 
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

#save pdf
pdf("primopdf.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()

#stretch histogramm
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")


# par natural colours, flase colours, and false colours with histogram stretching
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")


# install.packages("RStoolbox")
library(RStoolbox)

#####multitemporal set 31032021
#image 1988
#p224r63_1988_masked

#library(raster) richiama il pacchetto installato e verifico se ci sono stati problemi di installazione (richiama a sua volte sp)

#setwd("C:/lab/") indica il percorso della cartella di lavoro su windows
p224r63_1988 <- brick("p224r63_1988_masked.grd")

p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_1988) #plot tutte le bande

#plot dei due dati in RGB colori naturali
par(mfrow=c(1,2))
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

#plot dei due dati in RGB falso colore
par(mfrow=c(1,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

pdf("FalseColor.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
