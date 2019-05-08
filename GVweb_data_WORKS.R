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
             popup = paste(popupImage(list("https://github.com/alisonporchnik/GV_Map.io/blob/master/images/quill.jpg?embed=true",
                                            "https://github.com/alisonporchnik/GV_Map.io/blob/master/images/WS_bookshop.jpg?embed=true",
                                            "https://raw.githubusercontent.com/alisonporchnik/GV_Map.io/master/images/GV_Bookshop.jpg?embed=true",
                                            "http://gothamist.com/attachments/arts_jen/madhatter2.jpg",
                                            "https://raw.githubusercontent.com/alisonporchnik/GV_Map.io/master/images/romany'_SM.jpeg?embed=true",
                                            "https://ephemeralnewyork.files.wordpress.com/2008/06/pollyholladays.jpg",
                                            "https://ephemeralnewyork.files.wordpress.com/2011/04/romanymarietavern.jpg")), "<br>" ,
                                            "Establishment:", GV$Establishment, "<br>" ,
                                               "Address:" , GV$Address, "<br>" , "About" , paste(GV$About)))

                                 



GV_map

saveWidget(GV_map, file="GV_locations.html")


