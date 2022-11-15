library(ggplot2)
library(dplyr)

majors_list <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/majors-list.csv")
View(majors_list)

# library
library(treemap)

# Build Dataset
group <- c(rep("Agriculture & Natural Resources", 10), rep("Arts", 8), 
          rep("Biology & Life Science", 14), rep("Business", 13), 
          rep("Communications & Journalism", 4), 
          rep("Computers & Mathematics", 11),
          rep("Education", 16), rep("Engineering", 29),
          rep("Health", 12),
          rep("Humanities & Liberal Arts", 15),
          rep("Industrial Arts & Consumer Services", 7),
          rep("Interdisciplinary", 1),
          rep("Law & Public Policy", 5),
          rep("Less than Bachelor's Degree", 1),
          rep("Physical Sciences", 10),
          rep("Psychology & Social Work", 9),
          rep("Social Science", 9))
subgroup <- c(majors_list$Major)
value <- c(10, 8, 14, 13, 4, 11, 16, 29, 12, 15, 7, 1, 5, 1, 10, 9, 9)

data <- data.frame(group,subgroup,value)

# treemap
treemap(data,
        index=c("group","subgroup"),
        vSize="value",
        type="index"
) 