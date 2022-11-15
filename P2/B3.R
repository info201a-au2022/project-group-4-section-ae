library(tidyverse)
women_stem <- read_csv("https://storage.googleapis.com/kagglesdsdata/datasets/1285020/2141578/women-stem.csv?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=gcp-kaggle-com%40kaggle-161607.iam.gserviceaccount.com%2F20221114%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20221114T003447Z&X-Goog-Expires=259200&X-Goog-SignedHeaders=host&X-Goog-Signature=e231dc60091301d5485fa20a677d2bda5fefbe12cca40b4167245bc0d281bf38c92a48af731d3d804b8cf56fd417b5db9f716d97dd4f3c3aac1b8b1c91572554743bfd1f53d8ea0122c93ecbb2019a650c728699137252ad892dfc0c6027b9aab75b952b2a00365c2949ad26a9013f8a64003167097779a5e2513ed935b959879fe37c67a7e410ede6f6ae5fd13a7e2371f91b97603f0c30bac40bc14a15731389ad0c62cca8f19f63d54a033c224c8411d2b6bd4e75f522baae0989f69e51e1d77bf58d05cbe716b460d2ed4e480a1d5670cb2275d782a2bc400cad18029fea15db3bf9f66bb43dff144c48fa757eafb6a40fc04e947c640de8e75ea72475f7")

data_table <- women_stem %>% group_by(Major_category)

data_table <- aggregate(data_table$Women, by = list(data_table$Major_category), FUN = mean)
colnames(data_table)[1] <- "Major Catagories"
colnames(data_table)[2] <- "Total Number of Women"
