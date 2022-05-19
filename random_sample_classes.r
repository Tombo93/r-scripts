library(dplyr)

# TODO: Es muss noch dafür gesort werden,
# dass man einen split angeben kann (z.B. c(0.6,0.4))
# anstelle von einer sample_size
sample_by_class <- function(df, group, sample_size, replace=FALSE) {
  # df : ein dataframe
  # group : hiernach soll gruppiert werden
  # sample_size : das ist die sample größe pro Kategorie
  grouped_samples <- 
    df %>%
    group_by(group) %>%
    slice_sample(
      n=sample_size,
      replace=replace
    )
    return(grouped_samples)
}

groups <- sample_by_class(BTK, Level_1, 100)

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