library(tidyverse)


cces <- drop_na(read_csv(url("https://www.dropbox.com/s/ahmt12y39unicd2/cces_sample_coursera.csv?raw=1")))


#####Variations on Scatterplots
####Add a best-fit line with geom_smooth

ggplot(data=cces) +
  aes(x=educ, y=ideo5) +
  geom_jitter()

# ------------------------------------------------------

ggplot(data=cces) +
  aes(x=educ, y=ideo5) +
  geom_jitter() +
  geom_smooth()

# ------------------------------------------------------

ggplot(cces,aes(x=educ,y=ideo5))+
  geom_jitter()+
  geom_smooth() ####the default line is a loess curve

# ---------------------------------------------------
fig <- ggplot(cces,aes(x=educ,y=ideo5))

fig +
  geom_jitter() +
  geom_smooth(method='lm', level=.9) # linear regression and adjust confidence level

# -------------------------------------------------------

#install.packages("GGally")
library(GGally)
# The R package 'ggplot2' is a plotting system based on the grammar of graphics.
#'GGally' extends 'ggplot2' by adding several functions to reduce the complexity 
# of combining geometric objects with transformed data.

####Make up some numeric data. Two variables will be positively correlated, and 
# the third will be negatively correlated with the first

var1<-runif(100,min=0,max=1)
var2<- var1+rnorm(100,1,.2)
var3<- var1*(-rnorm(100,1,.2))


df<-tibble(var1,var2,var3)

ggpairs(df)

######Customize the matrix figures

# Write your own function for the scatterplot

my_scatter<-function(data,mapping){
  ggplot(data=data,mapping=mapping)+
    geom_jitter(color="red")
}


# Write your own function for the density plot

my_density<-function(data,mapping){
  ggplot(data=data,mapping=mapping)+
    geom_density(alpha=.05,
                 fill="red")
}

# substitute your functions for the functions that ggpairs() uses to draw the figures

ggpairs(df,
        lower=list(continuous=my_scatter),
        diag=list(continuous=my_density))

# ------------------------------------------------------------

# Correlation Plots
library(ggcorrplot)
library(ggthemes)

df<- cces %>% select("educ","pid7","pew_religimp") #select only numeric (non categoric) variables
 
#####calculate correlation coefficients

r <- cor(df,use="complete.obs") 

#generate the correlation plot

ggcorrplot(r)


####show just the lower part of the figure (to avoid 1 correlations on the diagonals)

ggcorrplot(r,type="lower")


####modify some visual elements

ggcorrplot(r,
           title="Correlations",
           colors = c("#11399e", "white", "#9e1111"),
           outline.color="purple")

# -------------------------------------------------------------------------------
# Cleaveland Dotplot

# Use some of the congress data

cel_114 <- cel %>% filter(congress==114)

members <- sample_n(cel_114,25) # pick a sample of 25 congressmen

####points only

ggplot(data = members) +
  aes(x = les,
      y = reorder(thomas_name, les)) + # reorder in descending
  geom_point(size=3) +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(linetype = 'dashed', color='black')) +
  labs(x='Legislative effectiveness', y='')

# Lollipop figure
ggplot(data = members) +
  aes(y = les,
      x = reorder(thomas_name,les )) +
  geom_point(size=2) +
  geom_segment(aes(x=thomas_name, xend=thomas_name,y=0,yend=les)) +
  theme(axis.text.x=element_text(angle=90)) +
  labs(x='Legislative effectiveness', y='')





              