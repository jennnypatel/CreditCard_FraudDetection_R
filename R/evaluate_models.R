library(pROC)
library(caret)

evaluate_models <- function(models, test_data) {
  results <- list()

  # Logistic Regression
  lr_probs <- predict(models$logistic, newdata = test_data, type = "response")
  lr_preds <- ifelse(lr_probs > 0.5, 1, 0)

  # Decision Tree
  tree_preds <- predict(models$tree, newdata = test_data, type = "class")
  tree_probs <- predict(models$tree, newdata = test_data)[, 2]

  # ANN
  ann_probs <- predict(models$ann, newdata = test_data, type = "raw")
  ann_preds <- ifelse(ann_probs > 0.5, 1, 0)

  # GBM
  gbm_probs <- predict(models$gbm, newdata = test_data, n.trees = 300)
  gbm_preds <- ifelse(gbm_probs > 0.5, 1, 0)

  # Confusion matrices
  results$logistic <- confusionMatrix(factor(lr_preds), factor(test_data$Class))
  results$tree <- confusionMatrix(factor(tree_preds), factor(test_data$Class))
  results$ann <- confusionMatrix(factor(ann_preds), factor(test_data$Class))
  results$gbm <- confusionMatrix(factor(gbm_preds), factor(test_data$Class))

  # AUC
  results$auc <- list(
    logistic = auc(test_data$Class, lr_probs),
    tree = auc(test_data$Class, tree_probs),
    ann = auc(test_data$Class, ann_probs),
    gbm = auc(test_data$Class, gbm_probs)
  )

  return(results)
}
