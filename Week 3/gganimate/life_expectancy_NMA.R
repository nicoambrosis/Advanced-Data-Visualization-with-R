library(gapminder)
library(gganimate)
library(ggtext)
library(ggthemes)

anim <- ggplot(data = gapminder) +
  aes(x = gdpPercap,
      y = lifeExp,
      size = pop,
      colour = country) +
  geom_point(alpha = 0.7,
             show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2,12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  labs(title = 'Change in life expectancy in the last 50 years',
       subtitle = 'Year: {frame_time}',
       x = 'GDP per capita',
       y = 'Life expectancy',
       caption = '**data:** gapminder R package<br>**gif** gganimate<br>**data viz:** @nambrosis') +
  theme(panel.background = element_rect(fill = "#FCF6F5FF", color = NA),
        plot.background = element_rect(fill = "#990011FF", color = NA),
        plot.title = element_markdown(color = "white"),
        plot.subtitle = element_markdown(color = "white", margin = unit(c(0,0,0,2.5), "cm")),
        plot.caption = element_markdown(color = "white",hjust = 0)) +
  transition_time(year) +
  ease_aes('linear')

anim_save('Life_expectancy.gif', animation = anim)

#-----------------------------------------------------------------------------

anim_2 <- ggplot(data = gapminder) +
  aes(x = gdpPercap,
      y = lifeExp,
      size = pop,
      colour = country) +
  geom_point(alpha = 0.7,
             show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2,12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  labs(title = 'Change in life expectancy in the last 50 years',
       subtitle = 'Year: {frame_time}',
       x = 'GDP per capita',
       y = 'Life expectancy',
       caption = 'data viz @nambrosis') +
  
  theme_wsj() +
  transition_time(year) +
  ease_aes('linear')

anim_2
anim_save('Life_expectancy_2.gif', animation = anim_2)
