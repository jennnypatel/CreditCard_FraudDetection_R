library(rpart)
library(nnet)
library(gbm)

train_models <- function(train_data) {
  logistic_model <- glm(Class ~ ., data = train_data, family = binomial())
  tree_model <- rpart(Class ~ ., data = train_data, method = 'class')
  ann_model <- nnet(Class ~ ., data = train_data, size = 5, linout = FALSE, trace = FALSE, maxit = 200)
  gbm_model <- gbm(Class ~ ., distribution = "bernoulli", data = train_data, n.trees = 300, interaction.depth = 3, shrinkage = 0.01, verbose = FALSE)

  return(list(
    logistic = logistic_model,
    tree = tree_model,
    ann = ann_model,
    gbm = gbm_model
  ))
}