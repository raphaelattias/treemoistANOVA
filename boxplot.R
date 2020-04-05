#BOXPLOTS
# moisture est la réponse, branches sont les facteurs
layout(matrix(1:4,ncol=2))
boxplot(moisture ~ species, data = treemoist.dat)
boxplot(moisture ~ branches, data = treemoist.dat)
boxplot(moisture ~ location, data = treemoist.dat)
boxplot(moisture ~ transpiration, data = treemoist.dat)

library(ggplot2)
layout(matrix(1:2,ncol=1))
species = rep(c(treemoist.dat$species))
location = rep(c("Central","Distal","Proximal"))
moisture = rep(c(treemoist.dat$moisture))
data = data.frame(species,location,moisture)
ggplot(data,aes(x=species,y=moisture,fill=location))+geom_boxplot()

species = rep(c(treemoist.dat$species))
transpiration_type = rep(c("Rapid","Slow"))
moisture = rep(c(treemoist.dat$moisture))
data = data.frame(species,transpiration_type,moisture)
ggplot(data,aes(x=species,y=moisture,fill=transpiration_type))+geom_boxplot()
