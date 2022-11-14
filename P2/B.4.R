library(ggplot2)
library(dplyr)

women_stem <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/women-stem.csv")

arranged_stem <- women_stem %>% 
  mutate(desc(ShareWomen))

women_stem_plot <- ggplot(arranged_stem) +
  ggtitle("Shares of Total Women in STEM Majors") +
  geom_col(mapping = aes(x = ShareWomen, y = Major)) +
  labs(x = "Women as Share of Total Major Population", y = "Majors") +
  labs(caption = "This chart was included to show what STEM majors have the highest and lowest shares of women in each majors. 
  We wanted to note STEM majors and fields that could increase their gender diversity. 
  Our observations made us realize that major categories in Health (such as Communication Disorders Sciences and Services) 
  included the highest share of women, while majors in Engineering (such as Mining and Mineral Engineering) 
  was the category with the lowest share of women, demonstrating an area where STEM gender diversity needs to improve.") +
  theme(plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0)) 
women_stem_plot