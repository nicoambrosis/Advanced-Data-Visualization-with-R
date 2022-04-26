# this code has benn produce based on https://plotly-r.com/animating-views.html
# some modifications have been done. 
library(tidyverse)
library(plotly)

data(gapminder, package = "gapminder")

fig <-  ggplot(data = gapminder) +
  aes(x = gdpPercap,
      y = lifeExp,
      color = continent) +
  geom_point(aes(size = pop,
                 frame = year,
                 ids = country)) +
  scale_x_log10()

ggplotly(fig)


# -----------------------------------------------------------------------------
base <- gapminder %>% 
  plot_ly(x = ~gdpPercap,
          y = ~lifeExp,
          size = ~pop,
          text  = ~country,
          hoverinfo = 'text') %>% 
  layout(xaxis = list(type = 'log'))

base %>% 
  add_markers(color = ~continent,
              frame = ~year,
              ids = ~country) %>% 
  animation_opts(1000,
                 easing = 'elastic',
                 redraw = FALSE) %>% 
  animation_button(x = 1,
                   xanchor = 'right',
                   y = 0,
                   yanchor = 'bottom') %>% 
  animation_slider(currentvalue = list(prefix = 'YEAR',
                                       font = list(color = 'red')))
