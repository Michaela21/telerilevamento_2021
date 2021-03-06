# R_code_classification.r

library(raster)
library(RStoolbox) #pacchetto anche per classificazione

setwd("C:/lab")
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg") #per importare in r l'immagine del sole e nominarla so

plotRGB(so, 1,2,3, stretch="lin") # visualizzzazione in RGB

#classificazione non supervisionata
set.seed(42) #per bloccare i pixel usati come training set dalla funzione (altrimenti cambiano ogni volta, il numero si puà cambiare)
soc <- unsuperClass(so, nClasses=3) #classificazione non supervisionata con 3 classi dell'oggetto so e richiamrlo soc
plot(soc$map) #plottare la mappa classificata e uso $ per associare alla mappa dato che soc continene più cose


#classificazione non supervisionata con 20 classi (esercizio)
set.seed(42) 
soc20 <- unsuperClass(so, nClasses=20)
plot(soc20$map) 

#classificazione non supervisionata immagine a scelta (esercizio), download da https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images
sun <- brick("The_Sun_viewed_by_Solar_Orbiter_s_PHI_instrument_on_18_June_2020.png")
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)

sunc10 <- unsuperClass(sun, nClasses=10)
plot(sunc10$map)


# Gran Canyon
# landsat

library(raster)
library(RStoolbox) 
setwd("C:/lab")
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")#importo il dato in r e richiamo l'oggetto
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

gcc <- unsuperClass(gc, nClasses=2)#classificazione non supervisionata con 2 classi
gcc
plot(gcc$map)#plot della mappa contenuta nell'oggetto gcc

gcc10 <- unsuperClass(gc, nClasses=10)#esercizio di classificazione non sup con 10 classi
plot(gcc10$map)
