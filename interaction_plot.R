#INTERACTION PLOTS
layout(matrix(1:6,ncol=2))
interaction.plot(treemoist.dat$species, treemoist.dat$branches, treemoist.dat$moisture)
interaction.plot(treemoist.dat$species, treemoist.dat$location, treemoist.dat$moisture)
interaction.plot(treemoist.dat$species, treemoist.dat$transpiration, treemoist.dat$moisture)
interaction.plot(treemoist.dat$branches, treemoist.dat$location, treemoist.dat$moisture)
interaction.plot(treemoist.dat$branches, treemoist.dat$transpiration, treemoist.dat$moisture)
interaction.plot(treemoist.dat$location, treemoist.dat$transpiration, treemoist.dat$moisture)
