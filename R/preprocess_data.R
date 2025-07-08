library(caret)
library(dplyr)
library(ROSE)

preprocess_data <- function(data) {
  data$Amount <- scale(data$Amount)     # Normalize amount
  data <- data[, -1]                    # Remove "Time" column

  # Split into 80% training and 20% testing
  set.seed(123)
  splitIndex <- createDataPartition(data$Class, p = 0.8, list = FALSE)
  train <- data[splitIndex, ]
  test <- data[-splitIndex, ]

  # Balance training data (ROSE)
  train_balanced <- ROSE(Class ~ ., data = train, seed = 123)$data

  return(list(train = train_balanced, test = test))
}
