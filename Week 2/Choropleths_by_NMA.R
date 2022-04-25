library(tidyverse)
library(maps)



my_state_map <- map_data("state")

ggplot(data = my_state_map,
       mapping = aes(x = long,
                     y = lat,
                     group = group)) +
  geom_polygon(fill = 'white', color = 'black') +
  coord_quickmap()

#####this provides a list of continental states plus Washington, DC
states<- unique(my_state_map$region)


some_data_values <- data.frame(
  
  ####the region column is here so you can join this fake data with the my_state_map 
  # data by the region column
  "region"=states,
  
  "qual_value"=c(rep(LETTERS[1:10],4),
                 LETTERS[1:9]),
  
  "quant_value"=runif(49,0,5))

######join the data using the region as the column for merging
######be really careful about merging! tiny inconsistencies can create BIG problems

map_data_combined <- left_join(my_state_map,some_data_values,by="region")


######make a choropleth 
# Version #1

ggplot(data = map_data_combined, 
       mapping = aes(x = long,
                     y = lat,
                     group = group,
                     fill = quant_value)) +
  geom_polygon(color = 'black') +
  labs(x = '',
       y = '',
       caption = '**source:** map: maps R library| data: Fake data made *ad hoc*<br>**data viz:** @nicoambrosis',
       fill = 'Classification') +
  theme(axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        plot.caption = ggtext::element_markdown()) +
  coord_quickmap()

ggsave("Choroplets_#1.png", dpi = 300)



# Version #2
ggplot(data = map_data_combined, 
       mapping = aes(x = long,
                     y = lat,
                     group = group,
                     fill = qual_value)) +
  geom_polygon(color = 'black') +
  theme_classic() +
  labs(x = '',
       y = '',
       title = 'United Stated random color',
       caption = '**source:** map: maps R library | data: Fake data made *ad hoc*<br>**data viz:** @nicoambrosis',
       fill = 'Classification') +
  theme(axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        axis.line = element_blank(),
        plot.caption = ggtext::element_markdown()) +
  scale_fill_brewer(palette="Spectral") +
  coord_quickmap()

ggsave("Choroplets_#2.png", dpi = 300)


