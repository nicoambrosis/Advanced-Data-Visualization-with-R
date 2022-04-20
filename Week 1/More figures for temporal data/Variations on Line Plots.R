#####make temporal data

var1<-runif(10,0,25)
time<-seq(1:10)

df<-tibble(var1,time)

# we can use geom_area to fill the space below the line

ggplot(data = df) +
  aes(x = time, y = var1) +
  geom_area() +
  guides(fill = FALSE)

# ------------------------------------------------------------------------------
# Make a stacked line graph

####Create fake data for three people at three different time points

Bob<-tibble(person=rep("Bob",5),time=seq(1:5),change=runif(5,0,25))
Sue<-tibble(person=rep("Sue",5),time=seq(1:5),change=runif(5,0,25))
Lisa<-tibble(person=rep("Lisa",5),time=seq(1:5),change=runif(5,0,25))

df<-bind_rows(Bob,Sue,Lisa)


ggplot(data = df) +
  aes(x = time, y = change, fill = person) +
  geom_area() +
  scale_fill_brewer(palette = "Blues") +
  labs(fill='Person')

# ------------------------------------------------------------------------------
# Dumbbell Charts
install.packages("ggalt")
library(ggalt)

# reformat the fake data from the stacked area chart, so we are comparing times at 1 and 5 for Bob,
# Sue, and Lisa

df2<- df %>%
  filter(time==1 | time==5) %>%
  pivot_wider(names_from = time,values_from=change) %>%
  rename(year1=`1`,year5=`5`)


# Make a basic dumbbell chart
ggplot(data = df2) +
  aes(y = reorder(person,year1),
      x = year1,
      xend = year5) +
  geom_dumbbell()

# change some visualizations

ggplot(data = df2) +
  aes(y = reorder(person,year1),
      x = year1,
      xend = year5) +
  geom_dumbbell(
    colour_x = 'purple',
    colour_xend = 'red',
    size_x = 3,
    size_xend = 5
  ) +
  xlab("Year") + 
  ylab("Person") 

# -----------------------------------------------------------------------------





















