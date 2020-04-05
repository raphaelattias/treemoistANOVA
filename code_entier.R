data("treemoist.dat")
treemoist.dat
#tapply(treemoist.dat$V5, list(treemoist.dat$V4, treemoist.dat$V1), mean)
#tapply(treemoist.dat$V5, list(treemoist.dat$V4, treemoist.dat$V1), sd)
#plot.design(treemoist.dat)

#RENAME COLUMNS
names(treemoist.dat)[names(treemoist.dat) == "V1"] <- "species"
names(treemoist.dat)[names(treemoist.dat) == "V2"] <- "branches"
names(treemoist.dat)[names(treemoist.dat) == "V3"] <- "location"
names(treemoist.dat)[names(treemoist.dat) == "V4"] <- "transpiration"
names(treemoist.dat)[names(treemoist.dat) == "V5"] <- "moisture"

library("plyr")
treemoist.dat$species[treemoist.dat$species %in% "1"] <- "Loblolly_Pine"
treemoist.dat$species[treemoist.dat$species %in% "2"] <- "Shortleaf_Pine"
treemoist.dat$species[treemoist.dat$species %in% "3"] <- "Yellow_Poplar"
treemoist.dat$species[treemoist.dat$species %in% "4"] <- "Red_Gum"

treemoist.dat$location[treemoist.dat$location %in% "1"] <- "Central"
treemoist.dat$location[treemoist.dat$location %in% "2"] <- "Distal"
treemoist.dat$location[treemoist.dat$location %in% "3"] <- "Proximal"

treemoist.dat$transpiration[treemoist.dat$transpiration %in% "1"] <- "Rapid"
treemoist.dat$transpiration[treemoist.dat$transpiration %in% "2"] <- "Slow"

#QQPLOT
qqnorm(treemoist.dat$moisture, pch = 1, frame = FALSE)
qqline(treemoist.dat$moisture, col = "steelblue", lwd = 2)

library("car")
qqPlot(treemoist.dat$moisture)

#BOXPLOTS
# moisture est la réponse, branches sont les facteurs
#layout(matrix(1:4,ncol=2))
#boxplot(moisture ~ species, data = treemoist.dat)
#boxplot(moisture ~ branches, data = treemoist.dat)
#boxplot(moisture ~ location, data = treemoist.dat)
#boxplot(moisture ~ transpiration, data = treemoist.dat)

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

species = rep(c(treemoist.dat$species))
transpiration_type = rep(c("Rapid","Slow"))
moisture = rep(c(treemoist.dat$moisture))
data = data.frame(species,transpiration_type,moisture)
ggplot(data,aes(x=transpiration_type,y=moisture,fill=species))+geom_boxplot()

species = rep(c(treemoist.dat$species))
branches = rep(c("1","2","3","4","5"))
moisture = rep(c(treemoist.dat$moisture))
data = data.frame(species,branches,moisture)
ggplot(data,aes(x=species,y=moisture,fill=branches))+geom_boxplot()

#INTERACTION PLOTS
layout(matrix(1:2,ncol=1))
interaction.plot(treemoist.dat$species, treemoist.dat$branches, treemoist.dat$moisture)
interaction.plot(treemoist.dat$species, treemoist.dat$location, treemoist.dat$moisture)
interaction.plot(treemoist.dat$species, treemoist.dat$transpiration, treemoist.dat$moisture)
interaction.plot(treemoist.dat$location, treemoist.dat$branches, treemoist.dat$moisture)
interaction.plot(treemoist.dat$transpiration, treemoist.dat$branches, treemoist.dat$moisture)
interaction.plot(treemoist.dat$transpiration, treemoist.dat$location, treemoist.dat$moisture)

#ANOVA
tree <- aov(moisture ~ species + branches + location + transpiration + species:transpiration
            + branches:transpiration + location:transpiration, data=treemoist.dat)
summary(tree)

#REMOVE branches, transpiration:branches, location:transpiration
tree2 <- aov(moisture ~ species + location + transpiration + species:transpiration
             , data=treemoist.dat)
summary(tree2)

#TESTS AIC/BIC
fit.full <- lm(moisture ~ .,data=treemoist.dat)
for.aic <- step(lm(moisture ~ 1, data = treemoist.dat), direction = "forward", scope = formula(fit.full), k = 2, trace = 0)    
for.bic <- step(lm(moisture ~ 1, data=treemoist.dat), direction = "forward", scope = formula(fit.full), k = log(32), trace = 0)         # forward BIC
back.aic <- step(fit.full, direction = "backward", k = 2, trace = 0)        # backward AIC
back.bic <- step(fit.full, direction = "backward", k = log(32), trace = 0)  # backward BIC

summary(for.aic)


coef(tree)
coef(tree2)
options("contrasts")
