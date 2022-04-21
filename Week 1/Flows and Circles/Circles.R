#install.packages("packcircles")
library(packcircles)
library(ggthemes)



# Use congress data as an example
# Sample a number of members from the 114th Congress
# You can use the URLs here, or if they are broken or you prefer, download files 
# to your own computer and put in working directory
cel <- read_csv(url("https://www.dropbox.com/s/4ebgnkdhhxo5rac/cel_volden_wiseman%20_coursera.csv?raw=1"))

cel_114<- cel %>% filter(congress==114)
members<-sample_n(cel_114,25) # take a sample of 25 congressmen



packing<-circleProgressiveLayout(members$all_pass,sizetype='area')

members<-add_column(members,packing)

dat.gg<-circleLayoutVertices(packing,npoints=50)

ggplot() +
  geom_polygon(data = dat.gg,
               aes(x = x,
                   y = y,
                   group = id,
                   fill = as.factor(id),
                   alpha = 0.6)) +
  geom_text(data = members,
            aes(x = x,
                y = y,
                size = all_pass,
                label = thomas_name)) +
  theme_solarized() +
  scale_colour_solarized() +
  theme(legend.position = 'none') +
  labs(x = '',
       y = '',
       title = 'Packed Circles graph',
       subtitle = 'Shows contribution of some members of the 114th Congress of the US.',
       caption = '**source:** Ansolabehere, Stephen; Schaffner, Brian; Luks, Samantha, 2020, "CCES Common Content, 2019"<br>**data viz:** @nicoambrosis') +
  theme(plot.caption = ggtext::element_markdown()) +
  coord_equal() 

ggsave("Packed_circles.png", dpi = 300, width = 20, height = 20, units = "cm")
