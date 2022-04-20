# The graph can be modified by creating custom functions
# we have alseen this method in "Variatins on scatterplots"
library(GGally)
library(ggplot2)
library(dplyr)


#  data
df <- msleep %>% 
  mutate(log_brainwt = log(brainwt),
         log_bodywt = log(bodywt)) %>%
  select(log_brainwt, log_bodywt, sleep_total, sleep_rem)


# create a scatterplot matrix (regular)
ggpairs(df)



# ------------------------------------------

# we can modify the plot (density and scatter plots) using functions


# custom functin for density plot
my_density <- function(data, mapping, ...){
  ggplot(data = data, mapping = mapping) +
    geom_density(alpha = 0.5,
                 fill = 'cornflowerblue')
}

# custom function for scatterplot
my_scatter <- function(data, mapping, ...){
  ggplot(data=data, mapping=mapping) +
    geom_point(alpha = 0.5,
               color = 'cornflowerblue') +
    geom_smooth(method = 'lm',
                se = FALSE)
}

# create scatter plot matrix
ggpairs(df,
        lower = list(continuous  = my_scatter),
        diag = list(continuous  = my_density)) +
  labs(title = 'Mammal size and sleep characteristics',
       caption = '**source:** msleep Dataset (V. M. Savage and G. B. West. A quantitative, theoretical framework for understanding mammalian sleep. Proceedings of the National Academy of Sciences, 104 (3):1051-1056, 2007)"<br>**data viz:** @nicoambrosis') +
  theme(plot.caption = ggtext::element_markdown())

ggsave("Drawing Scatterplot Matrices.png", dpi = 300, width = 30, height = 15, units = "cm")
