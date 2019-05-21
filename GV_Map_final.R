require(data.table)
require(rgdal)
require(maptools)
require(rgeos)
require(maps)
require(rgeos)
require(sp)

GV<-read.csv("GV_Map.csv")
head(GV)

GV$Long <- GV$LONGITUDE
GV$Lat <- GV$LATITUDE
GV$Name <-GV$NAME
GV$Address <- GV$ADDRESS

coords <- cbind(GV$Long, GV$Lat)
Long <- as.numeric(GV$Long)
Lat <- as.numeric(GV$Lat)

require(sf)
require(sp)
library(shiny)
require(shiny)
library(magrittr)
library(leaflet)
require(leaflet)
library(htmlwidgets)
require(htmlwidgets)
GV<-read.csv("GV_map.csv")
head(GV)

GV_map <- leaflet(data=GV) 
GV_map <- leaflet(data=GV) %>%
  addTiles(urlTemplate = "http://mapwarper.net/maps/tile/38310/{z}/{x}/{y}.png") %>%
  addMarkers(~Long, ~Lat, 
             popup = paste(
                  "<img src =", GV$Image, " /><br>",
                  " ", GV$Name, "<br>", 
                  " ", GV$ID, "<br>","<br>", 
                  " ", GV$About, "</div>"))
                    
GV_map
saveWidget(GV_map, file="GV_locations.html")
                                            