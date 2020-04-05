#BOXPLOTS
# moisture est la réponse, branches sont les facteurs
layout(matrix(1:4,ncol=2))
boxplot(moisture ~ species, data = treemoist.dat)
boxplot(moisture ~ branches, data = treemoist.dat)
boxplot(moisture ~ location, data = treemoist.dat)
boxplot(moisture ~ transpiration, data = treemoist.dat)
