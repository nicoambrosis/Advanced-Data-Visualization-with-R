library(gcookbook)
hw_sp <- ggplot(data = heightweight) +
  aes(x = ageYear, y = heightIn)


hw_sp + geom_point()


hw_sp +
  geom_point() +
  stat_smooth(method = lm)


hw_sp +
  geom_point() +
  stat_smooth(method = lm, level = 0.99)
  

hw_sp +
  geom_point() +
  stat_smooth(method = lm, level = FALSE)

hw_sp +
  geom_point(color = "grey60") +
  stat_smooth(method = lm, level = FALSE, color = "black", size = 2)

hw_sp +
  geom_point(color = "grey60") +
  stat_smooth(color = "black", size = 2)



library(MASS)
biopsy_mod <- biopsy %>% mutate(classn = recode(class, benign = 0,
                                               malignant = 1))



plot <- ggplot(data = biopsy_mod) +
  aes(x = V1, y = classn)


plot +
  geom_point(
    position = position_jitter(width = 0.3, height = 0.06),
    alpha = 0.4,
    shape = 21, 
    size = 1.5
  )


plot +
  geom_jitter(
    width = 0.3,
    height = 0.06,
    alpha = 0.4,
    shape = 21,
    size = 1.5
  ) +
  stat_smooth(method = glm, method.args = list(family = binomial))




hw_sp <- ggplot(data = heightweight) +
  aes(x = ageYear, y = heightIn, color = sex)

hw_sp +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  geom_smooth(method = lm, se = FALSE, fullrange = TRUE)


















