#R_Copernicus_code
#Visuliazind Copernicus data

#install.packages("ncdf4") per installare il pacchetto che permette di leggere i fil .nc
library(ncdf4) #per controllare l'installazione del pacchetto e per richiamarlo in r
library (raster)

setwd("C:/lab/")#set la working directory

albedo <-raster("c_gls_FAPAR-RT0_202006300000_GLOBE_PROBAV_V2.0.1.nc")#importo in r il dato .nc chiamandolo albedo
albedo#per leggere i metadati

cl <- colorRampPalette(c('light blue','green','red','yellow'))(100) # applico color palette
plot(albedo, col=cl)# plot del dataset

#resampling
albedores<- aggregate(albedo, fact=100)

fapar <-raster("c_gls_FAPAR-RT0_202006300000_GLOBE_PROBAV_V2.0.1.nc")#importo in r il dato .nc chiamandolo fapar
fapar#per leggere i metadati

cl <- colorRampPalette(c('light blue','green','red','yellow'))(100) # applico color palette
plot(fapar, col=cl)# plot del dataset

#resampling
faparres<- aggregate(fapar, fact=100) #ricampionamento con fattore 100 (100*100 pixel riuniti in 1 pixel)
