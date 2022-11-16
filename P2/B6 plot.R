library(tidyverse)
library(ggplot2)
all_ages <- read.csv("https://storage.googleapis.com/kagglesdsdata/datasets/1285020/2141578/all-ages.csv?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=gcp-kaggle-com%40kaggle-161607.iam.gserviceaccount.com%2F20221114%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20221114T002553Z&X-Goog-Expires=259200&X-Goog-SignedHeaders=host&X-Goog-Signature=e6cf6b4167e944a0257e313ad976a87c7fb5f257ee22f7cf07e0a5d3c2e9c4cebe16e203214b09045da13c064ca07bbe709d39ac8026cecebd2c524385a75dbf340c27f5e2e9c0daafe402ff42d8ff571f1766a22b3ca72efd011daa04eef25302b816cf6ebba0a5e3f5d0bb95666ad4f3c4464819763c3782f5e035197bad9f1e6047c146231b4b32427236bc6ad9384f66a399b442c66e9dfcaaa606a9ef84ccec4d4f8e07735646633a2208cf7c28d4e42730109525e7a9c9fb88ca87673ece7e7a6e750e9b2619e6ade06ca978162014487cc2d73bfee01e4bdbfcfbd82740ebdde30ce50afdbc31590f8ad6234ade3c40184c06ad4348690649b8693819")
all_ages_plot <- ggplot(all_ages, aes(y = Major_category, x = Unemployment_rate)) + 
  ggtitle("Major and Unemployment Rate") + 
  labs(x = "Unemployment Rate" , y = "Major Catagories") + 
  geom_violin() + 
  labs(caption = "This chart demonstrates which catagories of college majors 
       have the greatest and least rates of Unemployment. We wanted to create a 
       data visualization that makes it easy for students to see which
       catagories of majors tend to guarentee higher rates of employment, 
       so that they are better informed. Our observations made us realize 
       that major catagories such as Art, Psychology & Social Work,
       and Humanities & Liberal Arts have the greatest unemployment rates.") +
  theme(plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0))
all_ages_plot
