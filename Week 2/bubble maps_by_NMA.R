library(tidyverse)
library(maps)
library(ggtext)

world <- map_data('world')

japan <- filter(world, region=='Japan')

# make the "bones" of the map
ggplot(data = japan, mapping = aes(x = long,
                                   y = lat,
                                   group = group))+
  geom_polygon(color = 'black', fill = 'white')



japan_cities <- filter(maps::world.cities,country.etc=="Japan")
head(japan_cities)
japan_big_cities <- filter(maps::world.cities,country.etc=="Japan" & pop>500000)


####make a point for every city
ggplot(data = japan, mapping = aes(x = long,
                                   y = lat,
                                   group = group)) +
  geom_polygon(color = 'black', fill = 'white', size = 0.75) +
  annotate("text", x = 140, y = 30, label = "Japan", size = 30, color = '#a61414')





ggplot(data = japan, mapping = aes(x= long,
                                   y= lat,
                                   group = group)) +
  geom_polygon(color="black",fill="white", size = 0.75) +
  geom_point(data = japan_big_cities,
             aes(x=long,
                 y=lat,
                 group=NULL,
                 size=pop),
             color="red")

#####now vary the color of the dots
japan_big_cities$qual <- sample(LETTERS[1:5],nrow(japan_big_cities),replace=TRUE)

ggplot(data = japan, mapping = aes(x= long,
                                   y= lat,
                                   group = group)) +
  geom_polygon(color="black",fill="white", size = 0.75) +
  geom_point(data = japan_big_cities,
             aes(x=long,
                 y=lat,
                 group=NULL,
                 color = qual,
                 size=pop))

#####do some tweaking
####no scientific notation in legend r ggplot -- scales package adds the "scale_size_continuous" function to our arsenal, and we can set label=comma
library(scales)

###change the column name to make the legend nicer
japan_big_cities$Population <- japan_big_cities$pop
japan_big_cities$Qualitative <- japan_big_cities$qual

ggplot(data = japan, mapping = aes(x= long,
                                   y= lat,
                                   group = group)) +
  geom_polygon(color="black",fill="white", size = 0.75) +
  geom_point(data = japan_big_cities,
             aes(x=long,
                 y=lat,
                 group=NULL,
                 color = Qualitative,
                 size=Population)) +
  theme_classic() +
  labs(x = '',
       y = '',
       caption = '**source:**<br>map:<br>>>>> maps R package<br>data:<br>>>>> *(i)* Population data: R package maps::world.cities<br>>>>> *(ii)* Color Data: Fake data made *ad hoc*<br>**data viz:** @nicoambrosis',
       title="Bubble map") +
  theme(plot.caption = element_markdown(hjust = 0),
        axis.text.x = element_blank(),
        axis.text.y=element_blank(),
        axis.line = element_blank(),
        axis.ticks = element_blank()) +
  annotate("text", x = 140, y = 30, label = "Japan", size = 20, color = '#a61414') +
  scale_size_continuous(label=comma)

ggsave("Bubble map Japan.png", dpi = 300, width = 25, height = 15, units = "cm")









