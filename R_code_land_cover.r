R_code_land_cover.r
install.packages("ggplot2")#pacchetto per allestire le mappe

library(raster)
library(RStoolbox)
library(ggplot2)

setwd('C:/lab/')

defor1<-brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")#plot con assi x e y

defor2<-brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")#plot con assi x e y


par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#multiframe with ggplot2 and gridExtra (pacchetto di R)
install.packages("gridExtra")
library(gridExtra)
p1<- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2<- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1,p2, nrow=2)

#unsupervised classification
d1c<-unsuperClass(defor1,nClasses=2)#di default utilizza 10000 samples
d1c
plot(d1c$map)

#set.seed() permette di avere sempre gli stessi risultati
d2c<-unsuperClass(defor2,nClasses=2)
plot(d2c$map)
#class2: agricolture
#class1: forest

d2c3<-unsuperClass(defor2,nClasses=3)#classificazione con 3 classi
plot(d2c3$map)

#frequenza pixel di una certa classe
freq(d1c$map)
#value  count, risultato
#[1,]     1  35116
#[2,]     2 306176

#proporzione
s1<-35116+306176
s1

prop1<-freq(d1c$map)/s1
#prop agricolture:0.1028914
#prop fores:0.8971086

s2<- 342726
prop2<-freq(d2c$map)/s2
prop2
#prop agricolture:0.479488
#prop fores: 0.520512

#built a dataframe
cover<-c("Forest","Agricolture")# le virgolette servono perchè non è un numero ma un nome e la c perchè ci sono 2 clocchi
percent_1992<-c(89.71,10.29)
percent_2006<-c(52.05,47.94)

percentages<-data.frame(cover, percent_1992,percent_2006)
percentages

#plot con ggplot
plot1<-ggplot(percentages, aes(x=cover, y=percent_1992, color=cover))+ geom_bar(stat="identity", fill="white") #aes(assi(x,y)), cover(decide struttura legenda) ,geom_bar(stat="identity", 

plot2<-ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

#gridExtraper plottare insieme i grafici
grid.arrange(plot1,plot2, nrow=1)

