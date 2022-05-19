install.packages("tidyverse")
library(tidyverse)
library(dplyr)
data("iris")

sample_by_class <- function(df, group, sample_size) {
  # slice_sample erwartet einen dataframe
  groups <- 
    df %>%
    group_by(group) %>%
    slice_sample(
      n=sample_size,
      replace=FALSE, # FALSE, wenn Zeilen nicht 2-mal gesampelt werden sollen
    )
}
groups <- sample_by_class(BTK, OBJECTID, 100)

# groups <-
#   BTK %>%
#   select(OBJECTID) %>%
#   distinct(OBJECTID) %>%
#   rowwise() %>%
#   mutate(group = sample(
#     c('train', 'test'),
#     1,
#     replace = TRUE,
#     prob = c(0.6, 0.4)
#   ))

#   BTK <- BTK %>%
#     left_join(groups)

#   BTK_train <- filter(BTK, group == 'train')
#   BTK_test <- filter(BTK, group == 'test')