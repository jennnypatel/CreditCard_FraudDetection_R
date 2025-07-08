# R/run_full_pipeline.R

source("R/load_data.R")
source("R/preprocess_data.R")
source("R/train_models.R")
source("R/evaluate_models.R")

# Step 1: Load and preprocess
data <- load_creditcard_data("data/creditcard.csv")
splits <- preprocess_data(data)

# Step 2: Train models
models <- train_models(splits$train)

# Step 3: Evaluate
results <- evaluate_models(models, splits$test)

# Step 4: View results in console
cat("📌 Logistic Regression:\n")
print(results$logistic)

cat("\n📌 Decision Tree:\n")
print(results$tree)

cat("\n📌 ANN:\n")
print(results$ann)

cat("\n📌 GBM:\n")
print(results$gbm)

cat("\n📊 AUC Scores:\n")
print(results$auc)

# Step 5: Save to text
if (!dir.exists("report")) dir.create("report")
sink("report/model_evaluation.txt")

cat("📌 Logistic Regression:\n")
print(results$logistic)

cat("\n📌 Decision Tree:\n")
print(results$tree)

cat("\n📌 ANN:\n")
print(results$ann)

cat("\n📌 GBM:\n")
print(results$gbm)

cat("\n📊 AUC Scores:\n")
print(results$auc)

sink()

# Step 6: Save AUC as CSV
auc_df <- data.frame(
  Model = names(results$auc),
  AUC = as.numeric(results$auc)
)
write.csv(auc_df, "report/auc_scores.csv", row.names = FALSE)

# Step 7: Save model objects (optional)
save(models, file = "report/trained_models.RData")
