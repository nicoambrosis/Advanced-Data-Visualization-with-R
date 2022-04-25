library(tidyverse)
library(maps)

# In map_data we have:
#* maps::county()
#* maps::france()  
#* maps::italy()  
italy <- map_data('italy')
ggplot(data = italy, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = 'red', color = '#073301', alpha = 0.80) +
  labs(title = 'italy')

#* maps::nz()
nz <- map_data('nz')
ggplot(data = nz, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = 'black', color = 'black', alpha = 0.40) +
  labs(title = 'New Zeland')

#* maps::state()
state <- map_data('state')
ggplot(data = state, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = '#d41111', color = '#061f5c', alpha = 0.70) +
  labs(title = 'United States of America',
       subtitle = 'With states division')

#* maps::usa()
usa <- map_data('usa')
ggplot(data = usa, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = '#d41111', color = '#061f5c', alpha = 0.70) +
  labs(title = 'United States of America')

#* maps::world()
my_world_map <- map_data("world")
ggplot(data = my_world_map, mapping = aes(x= long, y= lat,group=group))+
  geom_polygon(fill="#0037c2",color="white", alpha = 0.70) +
  labs(title = 'Word #1')

#* maps::world2().  
my_world_map_2 <- map_data("world2")
ggplot(data = my_world_map_2, mapping = aes(x= long, y= lat,group=group))+
  geom_polygon(fill="#1a8c08",color="white", alpha = 0.70) +
  labs(title = 'Word #2')

#####let's look at just a country or countries

germany <- filter(my_world_map,region=="Germany")
ggplot(data=germany,mapping=aes(x=long,y=lat,group=group))+geom_polygon(fill="white",color="black")

arg <- filter(my_world_map, region=='Argentina')
ggplot(data=arg,mapping=aes(x=long,y=lat,group=group))+geom_polygon(fill="white",color="black")

france_germany <- filter(my_world_map,region=="France" | region=="Germany")

ggplot(data = france_germany, mapping = aes(x= long, y= lat,group=group))+geom_polygon(fill="white",color="black")


arg_br <- filter(my_world_map,region=="Argentina" | region=="Brazil")
ggplot(data=arg_br,mapping=aes(x=long,y=lat,group=group))+geom_polygon(fill="white",color="black")

#####get a region by filtering with lat and long

a_region<- filter(my_world_map,long>-10 & long<15.1 & lat>32 & lat<55)

ggplot(data = a_region, mapping = aes(x= long, y= lat,group=group))+geom_polygon(fill="white",color="black")
