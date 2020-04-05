#RENAME COLUMNS
names(treemoist.dat)[names(treemoist.dat) == "V1"] <- "species"
names(treemoist.dat)[names(treemoist.dat) == "V2"] <- "branches"
names(treemoist.dat)[names(treemoist.dat) == "V3"] <- "location"
names(treemoist.dat)[names(treemoist.dat) == "V4"] <- "transpiration"
names(treemoist.dat)[names(treemoist.dat) == "V5"] <- "moisture"

#RENAME ENTRIES
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
