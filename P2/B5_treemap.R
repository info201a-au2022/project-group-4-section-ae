library(ggplot2)
library(dplyr)

majors_list <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/majors-list.csv")
View(majors_list)

# Build Dataset
group <- c(rep("Agriculture & Natural Resources", 1), rep("Arts", 1), 
           rep("Biology & Life Science", 1), rep("Business", 1), 
           rep("Communications & Journalism", 1), 
           rep("Computers & Mathematics", 1),
           rep("Education", 1), rep("Engineering", 1),
           rep("Health", 1),
           rep("Humanities & Liberal Arts", 1),
           rep("Industrial Arts & Consumer Services", 1),
           rep("Interdisciplinary", 1),
           rep("Law & Public Policy", 1),
           rep("Less than Bachelor's Degree", 1),
           rep("Physical Sciences", 1),
           rep("Psychology & Social Work", 1),
           rep("Social Science", 1))
subgroup <- c("Agriculture & Natural Resources", "Arts", "Biology & Life Science",
              "Business", "Communications & Journalism", "Computers & Mathematics", 
              "Education", "Engineering", "Health", "Humanities & Liberal Arts", 
              "Industrial Arts & Consumer Services",
              "Interdisciplinary", "Law & Public Policy", 
              "Less than Bachelor's Degree", 
              "Physical Sciences", "Psychology & Social Work", "Social Science")
value <- c(10, 8, 14, 13, 4, 11, 16, 29, 12, 15, 7, 1, 5, 1, 10, 9, 9)

data <- data.frame(group, subgroup,value)

# treemap
treemap(data,
        index=c("group","subgroup"),
        vSize="value",
        type="index"
)
