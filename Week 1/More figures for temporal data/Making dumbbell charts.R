# Dumbbell charts are useful for displaying change between two time points for several 
# groups or observations. The geom_dumbbell function from the ggalt package is used.

# install.packages("gapminder")

library(ggalt)
library(tidyr)
library(dplyr)
library(gapminder)



# load data
data(gapminder, package = "gapminder")


# subset data
plotdata_long <- filter(gapminder,
                        continent == "Americas" &
                          year %in% c(1952, 2007)) %>%
  select(country, year, lifeExp)

# convert data to wide format
plotdata_wide <- spread(plotdata_long, year, lifeExp)

names(plotdata_wide) <- c("country", "y1952", "y2007")


# create dumbbell plot
# Version 1
# Change in life expectancy ordered by life expectancy in 2007
ggplot(data = plotdata_wide) + 
  aes(y = reorder(country, y2007),
      x = y1952,
      xend = y2007) +  
  geom_dumbbell(size_x = 2,
                colour_x = '#4287f5',
                size_xend = 2,
                colour_xend = '#f58742') +
  labs(x = 'Life expectancy',
       y = '',
       title = 'Change in Life Expectancy',
       subtitle = '1952 to 2007')

# Version 2
# Change in life expectancy ordered by net change in life expectancy

ggplot(data = plotdata_wide) + 
  aes(y = reorder(country, y2007-y1952),
      x = y1952,
      xend = y2007) +  
  geom_dumbbell(size = 1.2,
                colour = '#b3d0ff',
                size_x = 4,
                colour_x = '#4287f5',
                size_xend = 4,
                colour_xend = '#f58742') +
  labs(x = 'Life expectancy',
       y = '',
       title = 'Change in Life Expectancy',
       subtitle = '1952 to 2007')
