library(dplyr)
library(tidyverse)
library(caTools)

labels <- c('A', 'A', 'A', 'B', 'B', 'A', 'B', 'A', 'A', 'A')
data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
df <- data.frame(labels, data)

split <- caTools::sample.split(df$"labels", SplitRatio=0.6)
train = subset(df, split == TRUE)
test = subset(df, split == FALSE)
train
test
