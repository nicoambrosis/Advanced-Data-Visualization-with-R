# use geom_area to make staked a stacked area graph

library(gcookbook)

# version 1
ggplot(data = uspopage) +
  aes(x = Year, y = Thousands, fill = AgeGroup) +
  geom_area() +
  labs(title = "US Population by age",
       x = "Year",
       y = "Population in Thousands")

# version 2
ggplot(data = uspopage) +
  aes(x = Year, y = Thousands, fill = AgeGroup) +
  geom_area(colour = 'black',
            size = 0.2,
            alpha = 0.7) +
  scale_fill_brewer(palette = 'Blues') +
  labs(title = "US Population by age",
       x = "Year",
       y = "Population in Thousands")


# version 3
ggplot(data = uspopage) +
  aes(x = Year, y = Thousands, fill = AgeGroup) +
  geom_area(colour = 'black',
            size = 0.75,
            alpha = 0.7) +
  labs(title = "US Population by age",
       x = "Year",
       y = "Population in Thousands")

# version 4


ggplot(data = uspopage) +
  aes(x = Year, y = Thousands, fill = AgeGroup) +
  geom_area(colour = 'black',
            size = 0.95) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "US Population by age",
       x = "Year",
       y = "Population in Thousands")


