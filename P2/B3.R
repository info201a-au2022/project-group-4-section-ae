library(tidyverse)
women_stem <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/women-stem.csv")
<<<<<<< HEAD

data_table <- women_stem %>% group_by(Major_category)
=======
data_table <- women_stem %>% 
  group_by(Major_category)
>>>>>>> 4f49ff33c27898d108ca8aaf2a452fdec6175b92

data_table <- aggregate(data_table$Women, by = list(data_table$Major_category), FUN = mean)
colnames(data_table)[1] <- "Major Catagories"
colnames(data_table)[2] <- "Total Number of Women"
