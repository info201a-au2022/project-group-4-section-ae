# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:

women_stem <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/women-stem.csv")

summary_info_max <-list()
summary_info_max$num_observations <- nrow(women_stem)
summary_info_max$Median_max_value <- women_stem %>%
  filter(Median == max(Median, na.rm = T)) %>%
  select(Median)

summary_info_min <- list()
summary_info_min$num_observations <- nrow(women_stem)
summary_info_min$Median_min_value <- women_stem %>%
  filter(Median == min(Median, na.rm = T)) %>%
  select(Median)

summary_info_mean <- list()
summary_info_mean$num_observations <- nrow(women_stem)
summary_info_mean$Median_mean_value <- women_stem %>%
  filter(Median == mean(Median, na.rm = T)) %>%
  select(Median)

summary_info_median <- list()
summary_info_median$num_observations <- nrow(women_stem)
summary_info_median$Median_median_value <- women_stem %>%
  filter(Median == median(Median, na.rm = T)) %>%
  select(Median)

summary_info_range <- list()
summary_info_range$num_observations <- nrow(women_stem)
summary_info_range$Median_range_value <- women_stem %>%
  filter(Median == (max(Median, na.rm = T)) - min(Median, na.rm = T)) %>%
  select(Median)