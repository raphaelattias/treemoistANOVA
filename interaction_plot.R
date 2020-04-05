#INTERACTION PLOTS
layout(matrix(1:2,ncol=1))
interaction.plot(treemoist.dat$species, treemoist.dat$branches, treemoist.dat$moisture)
interaction.plot(treemoist.dat$species, treemoist.dat$location, treemoist.dat$moisture)
interaction.plot(treemoist.dat$species, treemoist.dat$transpiration, treemoist.dat$moisture)
interaction.plot(treemoist.dat$branches, treemoist.dat$location, treemoist.dat$moisture)
interaction.plot(treemoist.dat$branches, treemoist.dat$transpiration, treemoist.dat$moisture)
interaction.plot(treemoist.dat$location, treemoist.dat$transpiration, treemoist.dat$moisture)
