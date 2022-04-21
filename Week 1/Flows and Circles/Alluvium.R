# Flows

# install.packages("ggalluvial")
library(tidyverse)
library(ggplot2)
library(ggalluvial)
library(extrafont)
library(ggtext)



####Let's create some fake data about student performance in classes
####21 students are divided in 3 groups, they are men and women, and they get High Pass, Pass, or Fail


group1<-tibble(groupid=groupid<-rep("group1",7),
               studentID=sample(seq(from=1,to=20),7),
               gender=sample(c("M","F"),7,replace=TRUE),
               grades=sample(c("High Pass","Pass","Fail"),7,replace=TRUE))

group2<-tibble(groupid=groupid<-rep("group2",7),
               studentID=sample(seq(from=21,to=30),7),
               gender=sample(c("M","F"),7,replace=TRUE),
               grades=sample(c("High Pass","Pass","Fail"),7,replace=TRUE))

group3<-tibble(groupid=groupid<-rep("group3",7),
               studentID=sample(seq(from=31,to=40),7),
               gender=sample(c("M","F"),7,replace=TRUE),
               grades=sample(c("High Pass","Pass","Fail"),7,replace=TRUE))

students<-bind_rows(group1,group2,group3)

####Summarize data
students_table<- students %>%
  group_by(groupid,gender,grades) %>%
  count()


# make the "bones" of the alluvial
ggplot(students_table) +
  aes(axis1 = groupid,
      axis2 = grades,
      y = n) +
  geom_alluvium() +
  geom_stratum()


####add labels and split by gender
ggplot(data = students_table) +
  aes(axis1=groupid,
      axis2=grades,
      y=n) +
  geom_alluvium(aes(fill = gender)) +
  geom_stratum() +
  geom_text(stat="stratum",
            aes(label=after_stat(stratum)))


# Graph
ggplot(students_table,
       aes(axis1=groupid,
           axis2=grades,
           y=n)) +
  geom_alluvium(aes(fill=gender),
                width = 1/10) +
  geom_stratum() +
  geom_text(stat="stratum",
            aes(label=after_stat(stratum))) +
  
  labs(y = 'Frequency',
       title = 'Performance of **men** and **women** in school',
       subtitle = "Data from June 2021 <br> Holydays were not considered",
       caption = '**source:** Fake data made *ad hoc* | **data viz:** @nicoambrosis',
       fill = 'Gender') +
  
  theme(panel.background = element_rect(fill = "#e0e0e0", color = NA),
        plot.title = ggtext::element_markdown(),
        plot.subtitle = ggtext::element_markdown(),
        plot.caption = ggtext::element_markdown(),
        ) +
  scale_fill_manual(values=c("#fa96e3","#6ebeff"))

ggsave("Alluvium.png", dpi = 300, width = 15, height = 10, units = "cm")  

