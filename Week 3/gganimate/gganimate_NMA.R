# install.packages("magick")
# install.packages('gganimate')
library(ggplot2)
library(gganimate)
library(magick)

data(mtcars)

mtcars$gear

# regular box plot
ggplot(data = mtcars) +
  aes(x = factor(cyl),
      y = mpg) +
  geom_boxplot()


# facetted box plot
ggplot(data = mtcars) +
  aes(x = factor(cyl),
      y = mpg) +
  geom_boxplot() +
  facet_wrap(~gear)


# plots with animation
fig <- ggplot(data = mtcars) +
  aes(x = factor(cyl),
      y = mpg) +
  transition_states(gear)

animate(fig,renderer=magick_renderer())
