library(ggplot2)
library(dplyr)

arranged_stem <- women_stem %>% 
  arrange(desc(ShareWomen))

ggplot(arranged_stem) +
  ggtitle("Shares of Total Women in STEM Majors") +
  geom_col(mapping = aes(x = ShareWomen, y = Major)) +
  labs(caption = "This chart was included to show what STEM majors have the
  highest and lowest shares of women in each majors. We 
  wanted to note STEM majors and fields that could increase their 
       gender diversity. Our observations made us realize that
       major categories in Health (scuh as Commmunication Disorders Sciences
       and Services) included the highest share of women,
       while majors in Engineering (such as Mining and Mineral Engineering)
       was the category with the lowest share of
       women, demonstrating an area where STEM gender diversity
       needs to improve.")