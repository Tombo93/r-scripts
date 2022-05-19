library(dplyr)
library(tidyverse)


split_df <- function(df, train_p, test_p) {
  split_vec = sample(
    c(
      rep(0, train_p * nrow(df)),
      rep(1, test_p * nrow(df))
    )
  )
  train_df <- df[split_vec == 0, ]     
  test_df <- df[split_vec == 1, ]
  return(list("train" = train_df, "test" = test_df))
}


split_by_classes <- function(df, filter_col, classes) {
  train_df <- df[FALSE,] # Generiert leeren dataframe
  test_df <- df[FALSE,]
  for (name in classes) {
    class_df <- subset(df, name == filter_col)
    sets <- split_df(class_df, 0.6, 0.4)
    rbind(train_df, sets$train)
    rbind(test_df, sets$test)
  }
  return(list(train_df, test_df))
}


labels <- c('A', 'A', 'A', 'B', 'B', 'A', 'B', 'A', 'A', 'A')
data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
df <- data.frame(labels, data)
x <- split_by_classes(df, labels, list('A', 'B'))
x

train <- df %>% group_by(labels) %>% sample_frac(0.6, replace=FALSE)
test <- anti_join(df, train, by=labels)
train
test
