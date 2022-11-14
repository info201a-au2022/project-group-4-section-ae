library(ggplot2)
library(dplyr)

ggplot(women_stem) +
  ggtitle("Shares of Total Women in STEM Majors") +
  geom_col(mapping = aes(x = ShareWomen, y = Major)) +
  labs(subtitle = "This chart was included to show what STEM majors have the
  highest and lowest shares of women in each majors. We 
  wanted to note STEM majors and fields that could increase their 
       gender diversity.")