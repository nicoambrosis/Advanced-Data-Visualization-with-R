# Many of the notes of this notebook have been taken from
# https://ggplot2-book.org/maps.html


library(ggplot2)
library(maps)
library(tidyverse)
library(ggtext)

mi_counties <- map_data('county', 'michigan') %>% 
  select(lon = long, lat, group, id = subregion)


head(mi_counties)

# To get a better sense of what the data contains, we can plot mi_counties using geom_point()

ggplot(data = mi_counties) +
  aes(x = lon,
      y = lat) +
  geom_point(size = 0.25,
             show.legend = FALSE) +
  coord_quickmap() #  adjust the axes to ensure that longitude and latitude are rendered on the same scale.

ggplot(data = mi_counties) +
  aes(x = lon,
      y = lat,
      group = group) +
  geom_polygon(fill = 'white', color = 'grey50') +
  coord_quickmap()


ggplot(mi_counties, aes(lon, lat)) + 
  geom_point(size = .25, show.legend = FALSE) +
  coord_quickmap()

ggplot(mi_counties, aes(lon, lat, group = group)) +
  geom_polygon(fill = "white", colour = "grey50") + 
  coord_quickmap()


# ozmaps package by Michael Sumner https://github.com/mdsumner/ozmaps/ 
# which provides maps for Australian state boundaries, local government areas, 
# electoral boundaries, and so on

#install.packages('ozmaps')
#install.packages('sf')
library(ozmaps)
library(sf)
oz_states <- ozmaps::ozmap_states
oz_states

# The most important column is geometry, which specifies the spatial geometry 
# for each of the states and territories. 

ggplot(data = oz_states) +
  geom_sf() +
  coord_sf()


ggplot(oz_states) + 
  geom_sf() + 
  coord_sf()


# filter electorates in the Sydney metropolitan region
sydney_map <- ozmaps::abs_ced %>% filter(NAME %in% c(
  "Sydney", "Wentworth", "Warringah", "Kingsford Smith", "Grayndler", "Lowe", 
  "North Sydney", "Barton", "Bradfield", "Banks", "Blaxland", "Reid", 
  "Watson", "Fowler", "Werriwa", "Prospect", "Parramatta", "Bennelong", 
  "Mackellar", "Greenway", "Mitchell", "Chifley", "McMahon"
))


ggplot(data = sydney_map) +
  geom_sf(aes(fill = NAME), show.legend = FALSE) +
  coord_sf(xlim = c(150.97, 151.3),
           ylim = c(-33.98, -33.79)) +
  geom_sf_label(aes(label = NAME), label.padding = unit(1, 'mm')) +
  labs(x = 'longitud',
       y = 'latitud',
       title = ' Representacin of Sidney region capital of Australia',
       caption = '**source:**ozmaps R package by Michael Sumner<br>**data viz:** @nicoambrosis') +
  theme(plot.caption = element_markdown(hjust = 0))

ggsave("Sidney.png", dpi = 300, width = 25, height = 15, units = "cm")




