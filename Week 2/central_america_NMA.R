library(tidyverse)
library(maps)
library(ggthemes)
library(viridis)



set.seed(15)
Measurement<-rnorm(32,50,1)

map_2 <- filter(my_world_map, region == 'Costa Rica' | region == 'Panama' | region == 'Nicaragua')

world_cities <- maps::world.cities

cities <- filter(world.cities, country.etc == 'Costa Rica' | country.etc == 'Panama' | country.etc == 'Nicaragua')
cities <- filter(cities, pop > 40000)

cities %>% add_column(Measurement)

ggplot(data = map_2,
       mapping = aes(x = long,
                     y = lat,
                     group = group)) +
  geom_polygon(color = 'black', size = 1,  fill = '#41a667') +
  geom_point(data = cities,
             aes(x = long,
                 y = lat,
                 group = NULL,
                 size = 5,
                 color = pop)) +
  theme_classic() +
  labs(x = '',
       y = '',
       title = 'Central America bigger cities',
       subtitle = '(from: Nicaragua, Costa Rica and Panama)',
       caption = '**source:** <br> map: maps R package<br>population data: R package maps::world.cities<br>**data viz:** @nicoambrosis',
       color = 'Population') +
  theme(plot.caption = element_markdown(hjust = 0),
        
        plot.background = element_rect(fill = "#99d5f7", color = NA),
        panel.background = element_rect(fill = "#99d5f7", color = NA),
        
        axis.text.x = element_blank(),
        axis.text.y=element_blank(),
        axis.line = element_blank(),
        axis.ticks = element_blank(),
        
        legend.key.size = unit(1, "cm"),
        
        legend.position="bottom",
        legend.key.height= unit(4, 'mm'),
        legend.key.width= unit(20, 'mm'),
        legend.title = element_text(size=10)) +
  guides(size = 'none') +
  annotate("text", x = -82.5, y = 13, label = "Nicaragua", size = 5, color = '#a61414') +
  annotate("text", x = -85, y = 9, label = "Costa Rica", size = 5, color = '#a61414') +
  annotate("text", x = -80, y = 10, label = "Panama", size = 5, color = '#a61414') +
  
  scale_color_distiller(palette=9) +
  coord_quickmap()

ggsave("Central America.png", dpi = 300, width = 25, height = 15, units = "cm")




  

