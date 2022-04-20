library(gcookbook)

hw_sp <- ggplot(data=heightweight, aes(x=ageYear, y=heightIn, color=sex)) 


hw_sp + 
  geom_point() +
  scale_colour_brewer(palette = "Set1") +
  geom_smooth(method = lm) +
  labs(x = "Age",
       y = "Height",
       title = 'Height Vs Age by gender',
       color = 'Gender',
       caption = '**sourse:** heightweight(gcookbook) | **data viz:** @nicoambrosis') +
  theme(plot.title = ggtext::element_markdown(),
        plot.caption = ggtext::element_markdown(),
        legend.position=c(.9,.25)
        )
ggsave("Adding best fit lines.png", dpi = 300, width = 20, height = 20, units = "cm")  
  

