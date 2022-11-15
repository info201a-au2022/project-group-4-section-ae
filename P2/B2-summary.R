# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:

library(dplyr)

women_stem <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/women-stem.csv")
View()
summary_info_max <-list()
summary_info_max$Median_max_value <- women_stem %>%
  filter(Median == max(Median, na.rm = T)) %>%
  select(Median)

summary_info_min <- list()
summary_info_min$Median_min_value <- women_stem %>%
  filter(Median == min(Median, na.rm = T)) %>%
  select(Median)

summary_info_mean <- women_stem %>% 
  summarise(meansal = mean(women_stem$Median))

summary_info_median <- women_stem %>% 
  summarise(mediansal = median(women_stem$Median))

summary_info_range <- women_stem %>% 
  summarize((rangesal = ((max(women_stem$Median))-(min(women_stem$Median)))))
