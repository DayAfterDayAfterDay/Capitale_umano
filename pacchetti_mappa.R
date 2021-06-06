#nuovo file per pacchetti mappa
install.packages(c("cowplot","googleway","ggplot2","ggrepel","ggrepel","ggspatial",
                   "libwgeom","sf","rnaturalearth","rnaturalearthdata"))
library("ggplot2")
theme_set(theme_bw())
library("sf")

library("rnaturalearth")
library("rnaturalearthdata")

install.packages("rgeos")
library("rgeos")
world<-ne_countries(scale="medium",returnclass="sf")
class(world)

ggplot(data=world)+geom_sf()
