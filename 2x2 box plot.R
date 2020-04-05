# V5 est la réponse, V1,V2,V3,V4 sont les facteurs
layout(matrix(1:4,ncol=2))
boxplot(V5 ~ V1,data=treemoist)
boxplot(V5 ~ V2,data=treemoist)
boxplot(V5 ~ V3,data=treemoist)
boxplot(V5 ~ V4,data=treemoist)
