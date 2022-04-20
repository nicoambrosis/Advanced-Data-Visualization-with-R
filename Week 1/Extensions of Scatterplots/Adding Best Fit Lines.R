library(gcookbook)

hw_sp <- ggplot(data=heightweight, aes(x=ageYear, y=heightIn, color=sex)) 


hw_sp + 
  geom_point() +
  scale_colour_brewer(palette = "Set1") +
  geom_smooth(method = lm) +
  xlab("Age") + 
  ylab("Height") +
  ggtitle("Height Vs Age by gender") +
  labs(color='Gender') +
  theme(legend.position=c(.9,.25))
  

