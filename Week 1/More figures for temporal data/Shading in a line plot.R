# We want to make a graph with a shaded area.

# Convert the sunspot.year data set into a data frame for this example
sunspotyear <- data.frame(
  Year     = as.numeric(time(sunspot.year)),
  Sunspots = as.numeric(sunspot.year)
)


ggplot(data = sunspotyear) +
  aes(x = Year, y = Sunspots) +
  geom_area(fill = '#f7da88',
            alpha = 0.2) +
  geom_line(size = 1.25) +
  labs(title = 'Registered sunspots from 1700 to 1990')

