require(data.table)
require(rgdal)
require(maptools)
require(rgeos)
require(maps)
require(rgeos)
require(sp)

GV<-read.csv("map_draft_2.csv")
head(GV)

GV$Long <- GV$LONGITUDE
GV$Lat <- GV$LATITUDE
GV$Establishment <-GV$ESTABLISHMENT
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
require(leafpop)
GV<-read.csv("map_draft_2.csv")
head(GV)

GV_map <- leaflet(data=GV) 
GV_map <- leaflet(data=GV) %>%
  addTiles(urlTemplate = "http://mapwarper.net/maps/tile/38310/{z}/{x}/{y}.png") %>%
   addMarkers(~Long, ~Lat,
        popup = paste("Establishment:", GV$Establishment, "<br>",
                          "Address:", GV$Address, "<br>", "About:", GV$About, "<br>"))
leaflet() %>% addCircleMarkers(data = GV, popup = 
                                 popupImage("https://github.com/alisonporchnik/GV_photos/blob/master/GV_bookshop.jpg?raw=true"))
                               


GV_map

saveWidget(GV_map, file="GV_locations.html")


